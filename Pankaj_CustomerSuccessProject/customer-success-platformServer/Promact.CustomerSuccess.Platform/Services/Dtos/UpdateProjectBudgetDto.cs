﻿namespace Promact.CustomerSuccess.Platform.Services.Dtos
{
    public class UpdateProjectBudgetDto
    {
    
        public ProjectType Type { get; set; }
        public int? DurationInMonths { get; set; }
        public int? ContractDuration { get; set; }
        public int? BudgetedHours { get; set; }
        public double BudgetedCost { get; set; }
        public Guid ProjectId { get; set; }
    }
}
