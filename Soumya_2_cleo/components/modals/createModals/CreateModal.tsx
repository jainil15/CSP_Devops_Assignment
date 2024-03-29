'use client';

import { useMemo, useState } from "react";
import { 
  FieldValues, 
  SubmitHandler, 
  useForm
} from "react-hook-form";
import { useRouter } from "next/navigation";
import { motion } from 'framer-motion';
import Modal from "../Modal";
import Heading from "../../reusable/Heading";
import Input from "../../reusable/Input";
import axios from 'axios';
import toast from "react-hot-toast";
import useSuccessModal from "@/hooks/useSuccessModal";
import useCreateModal from "@/hooks/useLoginModal";
import { useModal } from "@/hooks/useModalStore";
import { ProgressBar } from "../../ProgressBar";

enum STEPS {
  DESCRIPTION = 0,
  CLIENTS = 1,
  MANAGER = 2,
  AUDITOR = 3,
}

interface CreateModalProps {
  user: any;
}
const CreateModal = ({
  user,
}: CreateModalProps) => {

  const router = useRouter();
  const createModal = useCreateModal();
  const { isOpen, onClose, type } = useModal();
  const successModal = useSuccessModal();
  const [currentStage, setCurrentStage] = useState(1);
  const [step, setStep] = useState(STEPS.DESCRIPTION);

  const [isLoading, setIsLoading] = useState(false);

  const {
    register,
    handleSubmit,
    setValue,
    watch,
    formState: {
        errors,
    },
    reset
} = useForm<FieldValues>({
    defaultValues: {
        createdBy: user?.id,
        name: '',
        client: '',
        manager: '',
        auditor: '',
    }
})

  const formToggle = () => {
    createModal.onClose();
    successModal.onOpen()
}

  const onBack = () => {
      setStep((value) => value - 1);
  }
  const onNext = () => {
      setStep((value) => value + 1);
  }

  const onSubmit: SubmitHandler<FieldValues> = async (data) => {
    if (step !== STEPS.AUDITOR){
      return onNext();
    }
    setIsLoading(true)
    console.log(data);
    axios.post('/api/projects', data)
        .then(() => {
            router.refresh();
            toast.success('Done');
        }) .catch((error) => {
            toast.error(error.message);
        }) .finally(() => {
            setIsLoading(false);
            formToggle();
    })
  }

  const actionLabel = useMemo(() => {
    if(step === STEPS.AUDITOR){
        return 'Create'
    }

    return 'Next'
  }, [step]);


  const secondaryActionLabel = useMemo(() => {
      if(step === STEPS.DESCRIPTION){
          return undefined;
      }
      return 'Back'
  }, [step]);


  const progress = useMemo(() => {
    return (step / (Object.keys(STEPS).length / 2 - 1)) * 100;
  }, [step]);


  let bodyContent = (
    <div className="flex flex-col gap-4">
      <Heading
        title="Project name"
        subtitle=""
        center
      />
        <motion.div
            key="manager"
            initial={{ opacity: 0, x: "-50%" }}
            animate={{ opacity: 1, x: "0%" }}
            exit={{ opacity: 0, x: "100%" }}
            transition={{ duration: 0.3, ease: "easeInOut" }}
        >
          <Input
            id="name"
            label="Name"
            disabled={isLoading}
            register={register}  
            errors={errors}
            required
          />
        </motion.div>
    </div>
  )

  if (step === STEPS.CLIENTS){
    bodyContent = (
      <div className="flex flex-col gap-4">
        <Heading
          title="Add clients"
          subtitle=""
          center
        />
        <motion.div
            key="client"
            initial={{ opacity: 0, x: "-50%" }}
            animate={{ opacity: 1, x: "0%" }}
            exit={{ opacity: 0, x: "100%" }}
            transition={{ duration: 0.3, ease: "easeInOut" }}
        >
          <Input
            id="client"
            label="Client"
            disabled={isLoading}
            register={register}  
            errors={errors}
            required
          />
        </motion.div>
        
      </div>
    )
  }

  if (step === STEPS.MANAGER){
    bodyContent = (
      <div className="flex flex-col gap-4">
        <Heading
          title="Project manager"
          subtitle=""
          center
        />
        <motion.div
            key="manager"
            initial={{ opacity: 0, x: "-50%" }}
            animate={{ opacity: 1, x: "0%" }}
            exit={{ opacity: 0, x: "100%" }}
            transition={{ duration: 0.3, ease: "easeInOut" }}
        >
          <Input
            id="manager"
            label="Project manager"
            disabled={isLoading}
            register={register}  
            errors={errors}
            required
          />
        </motion.div>
        
      </div>
    )
  }

  if (step === STEPS.AUDITOR){
    bodyContent = (
      <div className="flex flex-col gap-4">
        <Heading
          title="Auditor"
          subtitle=""
          center
        />
        <motion.div
            key="auditor"
            initial={{ opacity: 0, x: "-50%" }}
            animate={{ opacity: 1, x: "0%" }}
            exit={{ opacity: 0, x: "100%" }}
            transition={{ duration: 0.3, ease: "easeInOut" }}
        >
          <Input
            id="auditor"
            label="Project auditor"
            disabled={isLoading}
            register={register}  
            errors={errors}
            required
          />
        </motion.div>
        
      </div>
    )
  }


  return (
    <Modal
      disabled={isLoading}
      isOpen={createModal.isOpen}
      title="New project"
      actionLabel={actionLabel}
      onClose={createModal.onClose}
      secondaryActionLabel={secondaryActionLabel}
      secondaryAction={step == STEPS.DESCRIPTION ? undefined : onBack}
      onSubmit={handleSubmit(onSubmit)}
      body={
        <div className="flex flex-col gap-6 items-center">
          <div className="w-[90%] dark:bg-neutral-800 bg-gray-200 h-[2px] rounded-full">
            <ProgressBar currentStep={step} totalSteps={Object.keys(STEPS).length / 2} />
          </div>
          <div className="w-full">
            {bodyContent}
          </div>
        </div>
      }
    />
  );
}

export default CreateModal;