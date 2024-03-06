import React, { useState } from "react";
import axios from "axios";
import { toast } from "react-toastify";
import { useParams } from "react-router-dom";

function EditVersionHistory({ versionHistory, setFetch, closeModal }) {
  const [versionNo, setVersionNo] = useState(versionHistory.version_no || "");
  const [versionType, setVersionType] = useState(
    versionHistory.version_type || ""
  );
  const [change, setChange] = useState(versionHistory.change || "");
  const [createdBy, setCreatedBy] = useState(versionHistory.created_by || "");
  const [revisionDate, setRevisionDate] = useState(
    versionHistory.revision_date || ""
  );
  const [reason, setReason] = useState(versionHistory.reason || ""); // Added reason state
  const { id } = useParams();
  // console.log(id);
  const handleSubmit = async (e) => {
    e.preventDefault();

    const updatedVersion = {
      version_no: versionNo,
      version_type: versionType,
      change,
      created_by: createdBy,
      revision_date: revisionDate,
      reason, // Include reason in the updated version object
    };

    try {
      await axios.put(
        `/api/v1/projects/${id}/version_histories/${versionHistory.id}`,
        updatedVersion
      );
      toast.success("Version history updated successfully.");
      setFetch((prev) => !prev);
      closeModal();
    } catch (error) {
      console.error("Error updating version history:", error);
      toast.error("An error occurred while updating the version history.");
    }
  };

  return (
    <div className="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 z-50">
      <div className="bg-white p-8 rounded-md">
        <button
          onClick={closeModal}
          className="absolute top-0 right-0 m-4 text-gray-500 hover:text-gray-700"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            className="h-6 w-6"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth={2}
              d="M6 18L18 6M6 6l12 12"
            />
          </svg>
        </button>
        <h2 className="text-lg font-semibold mb-4">Edit Version History</h2>
        <form onSubmit={handleSubmit}>
          <div className="mb-4">
            <label>Version No:</label>
            <input
              type="text"
              value={versionNo}
              onChange={(e) => setVersionNo(e.target.value)}
              className="border rounded-md px-2 py-1 ml-2"
            />
          </div>
          <div className="mb-4">
            <label>Version Type:</label>
            <input
              type="text"
              value={versionType}
              onChange={(e) => setVersionType(e.target.value)}
              className="border rounded-md px-2 py-1 ml-2"
            />
          </div>
          <div className="mb-4">
            <label>Change:</label>
            <input
              type="text"
              value={change}
              onChange={(e) => setChange(e.target.value)}
              className="border rounded-md px-2 py-1 ml-2"
            />
          </div>
          <div className="mb-4">
            <label>Reason:</label>
            <input
              type="text"
              value={reason}
              onChange={(e) => setReason(e.target.value)}
              className="border rounded-md px-2 py-1 ml-2"
            />
          </div>
          <div className="mb-4">
            <label>Created By:</label>
            <input
              type="text"
              value={createdBy}
              onChange={(e) => setCreatedBy(e.target.value)}
              className="border rounded-md px-2 py-1 ml-2"
            />
          </div>
          <div className="mb-4">
            <label>Revision Date:</label>
            <input
              type="date"
              value={revisionDate}
              onChange={(e) => setRevisionDate(e.target.value)}
              className="border rounded-md px-2 py-1 ml-2"
            />
          </div>
          <div className="flex justify-end">
            <button
              type="submit"
              className="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600 mr-2"
            >
              Save
            </button>
            <button
              onClick={closeModal}
              className="bg-gray-300 text-gray-800 px-4 py-2 rounded-md hover:bg-gray-400"
            >
              Cancel
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}

export default EditVersionHistory;
