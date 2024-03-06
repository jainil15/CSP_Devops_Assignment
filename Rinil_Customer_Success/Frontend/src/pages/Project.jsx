import React, { useState, useEffect } from "react";
import axios from "axios";
import { useParams } from "react-router-dom";
import {
  Tab,
  TabList,
  TabPanels,
  TabsContext,
  TabPanel,
} from "monday-ui-react-core";

import AddProjectOverview from "../components/AddProjectOverview";
import EditScopeStack from "../components/EditScopeStack";
import AuditHistory from "../components/AuditHistory/AuditHistory";
import VersionHistory from "../components/VersionHistory/VersionHistory";
import Stackholder from "../components/Stackholder/Stackholder";
import RiskProfiling from "../components/RiskProfiling/RiskProfiling";
import SprintDetails from "../components/SprintDetails/SprintDetails";
import Phases from "../components/Phases/Phases";
import EscalationMatrix from "../components/EscalationMatix/EscalationMatixes";

export default function Project() {
  const { id } = useParams();
  const [project, setProject] = useState(null);
  const [fetch, setFetch] = useState(false);

  useEffect(() => {
    const fetchProject = async () => {
      try {
        const response = await axios.get(`/api/v1/projects/${id}`);
        setProject(response.data);
      } catch (error) {
        console.error("Error fetching project:", error);
      }
    };

    fetchProject();

    // return () => {
    //   // Cleanup function
    // };
  }, [id]);

  const handleClick = () => {
    axios({
      url: "/pdf/generate_pdf",
      method: "GET",
      responseType: "blob", // Specify the response type as blob
    })
      .then((response) => {
        // Create a new blob object with the response data
        const blob = new Blob([response.data], { type: "application/pdf" });

        // Create a URL for the blob object
        const url = window.URL.createObjectURL(blob);

        // Create a link element
        const a = document.createElement("a");
        a.href = url;
        a.download = "project.pdf"; // Specify the file name
        a.click(); // Trigger the click event to start the download
      })
      .catch((error) => {
        // Handle error
        console.error("There was an error:", error);
      });
  };

  return (
    <div>
      {project ? (
        <div>
          <h2 className="text-2xl font-bold text-gray-900">
            {project.project_name}
          </h2>
          {/* <br /> */}
          <div className="flex justify-end mr-4">
            <button
              onClick={handleClick}
              className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
            >
              Generate PDF
            </button>
          </div>

          {/* <hr /> */}

          {/* <p className="text-xl font-bold text-gray-900">
            Description: {project.project_desc}
          </p> */}
          {/* Add other project details */}

          <TabsContext>
            <TabList>
              <Tab>Overview</Tab>
              <Tab>Scope & stack</Tab>
              <Tab>Escalation Matixes</Tab>
              <Tab>Audit History</Tab>
              <Tab>Versoin History</Tab>
              <Tab>Stakeholders</Tab>
              <Tab>Risk Profiling</Tab>
              <Tab>Phases</Tab>
              <Tab>Sprint detail</Tab>
            </TabList>
            <TabPanels>
              <TabPanel>
                {/* PROJECT OVERVIEW COMPONENT  */}
                <AddProjectOverview project={project} setFetch={setFetch} />
              </TabPanel>
              <TabPanel>
                {/* SCOPE AND STACK  */}
                <EditScopeStack project={project} setFetch={setFetch} />
              </TabPanel>
              <TabPanel>
                {/* ESCALATION MATRIXES */}
                <EscalationMatrix projectId={id} />
              </TabPanel>
              <TabPanel>
                {/* AUDIT HISTORY */}
                <AuditHistory project={project} setFetch={setFetch} />
              </TabPanel>
              <TabPanel>
                {/* VERSION HISTORY */}
                <VersionHistory project={project} setFetch={setFetch} />
              </TabPanel>
              <TabPanel>
                {/* STAKEHOLDERS */}
                <Stackholder project={project} setFetch={setFetch} />
              </TabPanel>
              <TabPanel>
                {/* RISK PROFILING */}
                <RiskProfiling project={project} setFetch={setFetch} />
              </TabPanel>
              <TabPanel>
                {/* PHASES */}
                <Phases project={project} setFetch={setFetch} />
              </TabPanel>
              <TabPanel>
                {/* SPRINT DETAIL */}
                <SprintDetails project={project} setFetch={setFetch} />
              </TabPanel>
            </TabPanels>
          </TabsContext>
        </div>
      ) : (
        <p>Loading...</p>
      )}
    </div>
  );
}
