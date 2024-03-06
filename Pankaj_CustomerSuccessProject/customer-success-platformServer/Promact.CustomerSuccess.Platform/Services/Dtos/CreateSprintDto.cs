﻿namespace Promact.CustomerSuccess.Platform.Services.Dtos
{
    public class CreateSprintDto
    {
        public Guid PhaseMilestoneId { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public SprintStatus Status { get; set; }
        public string Comments { get; set; }
        public string Goals { get; set; }
        public int SprintNumber { get; set; }
    }
}
