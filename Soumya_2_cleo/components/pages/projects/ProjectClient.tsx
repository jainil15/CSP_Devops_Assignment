"use client"

import Heading from "@/components/reusable/Heading";
import { ProjectItem } from "./ProjectItem";
import EmptyState from "../EmptyState";
import useCreateModal from "@/hooks/useLoginModal";
import { useEffect, useState } from "react";

interface ProjectClientProps {
    user?: any;
    projects?: any;
}

export const ProjectClient = ({
    user,
    projects,
}: ProjectClientProps) => {

    const createModal = useCreateModal();

    // useEffect(() => {
    //     const fetchProjects = async () => {
    //       try {
    //         const response = await axios.get(`http://127.0.0.1:3001/projects?userId=${user.id}`);
    //         setProjects(response.data);
    //       } catch (error) {
    //         console.error('Error fetching projects:', error);
    //       }
    //     };
    
    //     fetchProjects();
    
    //     const intervalId = setInterval(fetchProjects, 100); // Refresh every 100 ms
    
    //     return () => clearInterval(intervalId); // Cleanup on component unmount
    //   }, [user]);

    const [heading, setHeading] = useState('');

    useEffect(() => {
        const userRole = user.role;
        let newHeading = '';

        if (userRole === 'ADMIN' || userRole === 'CLIENT') {
            newHeading = 'Your projects';
        } else if (userRole === 'MANAGER' || userRole === 'AUDITOR') {
            newHeading = 'Projects assigned to you';
        } else {
            // Default title if the user role doesn't match any condition
            newHeading = 'Projects';
        }

        setHeading(newHeading);
    }, [user.role]);


    return (
        <div className="w-full h-full ">
            <div className="w-full h-[8%]">
                <Heading 
                    title={`${heading}`}
                />
            </div>
            <div className="overflow-hidden overflow-y-scroll w-full h-[92%] mt-2 mb-2 scrollbar-hide">
                {projects && projects.length > 0 ? (
                    <div className="grid grid-cols-1 sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-3 2xl:grid-cols-4 gap-2">
                        {projects.map((project: any, index: number) => (
                            <div key={index} className="flex flex-col mt-2">
                                <ProjectItem project={project}/>
                            </div>
                        ))}
                    </div>
                ) : (
                    <div>
                        <EmptyState
                            title="No projects found"
                            subtitle="Start by creating your first project"
                            showButton={user.role === "ADMIN"}
                            buttonLabel="Create"
                            onClick={createModal.onOpen}
                        />
                    </div>
                )}
            </div> 
        </div>
    )
}