--
-- jainilQL database dump
--

-- Dumped from database version 15.5
-- Dumped by pg_dump version 15.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: AbpAuditLogActions; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpAuditLogActions" (
    "Id" uuid NOT NULL,
    "TenantId" uuid,
    "AuditLogId" uuid NOT NULL,
    "ServiceName" character varying(256),
    "MethodName" character varying(128),
    "Parameters" character varying(2000),
    "ExecutionTime" timestamp without time zone NOT NULL,
    "ExecutionDuration" integer NOT NULL,
    "ExtraProperties" text
);


ALTER TABLE public."AbpAuditLogActions" OWNER TO jainil;

--
-- Name: AbpAuditLogs; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpAuditLogs" (
    "Id" uuid NOT NULL,
    "ApplicationName" character varying(96),
    "UserId" uuid,
    "UserName" character varying(256),
    "TenantId" uuid,
    "TenantName" character varying(64),
    "ImpersonatorUserId" uuid,
    "ImpersonatorUserName" character varying(256),
    "ImpersonatorTenantId" uuid,
    "ImpersonatorTenantName" character varying(64),
    "ExecutionTime" timestamp without time zone NOT NULL,
    "ExecutionDuration" integer NOT NULL,
    "ClientIpAddress" character varying(64),
    "ClientName" character varying(128),
    "ClientId" character varying(64),
    "CorrelationId" character varying(64),
    "BrowserInfo" character varying(512),
    "HttpMethod" character varying(16),
    "Url" character varying(256),
    "Exceptions" text,
    "Comments" character varying(256),
    "HttpStatusCode" integer,
    "ExtraProperties" text NOT NULL,
    "ConcurrencyStamp" character varying(40) NOT NULL
);


ALTER TABLE public."AbpAuditLogs" OWNER TO jainil;

--
-- Name: AbpClaimTypes; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpClaimTypes" (
    "Id" uuid NOT NULL,
    "Name" character varying(256) NOT NULL,
    "Required" boolean NOT NULL,
    "IsStatic" boolean NOT NULL,
    "Regex" character varying(512),
    "RegexDescription" character varying(128),
    "Description" character varying(256),
    "ValueType" integer NOT NULL,
    "ExtraProperties" text NOT NULL,
    "ConcurrencyStamp" character varying(40) NOT NULL
);


ALTER TABLE public."AbpClaimTypes" OWNER TO jainil;

--
-- Name: AbpEntityChanges; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpEntityChanges" (
    "Id" uuid NOT NULL,
    "AuditLogId" uuid NOT NULL,
    "TenantId" uuid,
    "ChangeTime" timestamp without time zone NOT NULL,
    "ChangeType" smallint NOT NULL,
    "EntityTenantId" uuid,
    "EntityId" character varying(128),
    "EntityTypeFullName" character varying(128) NOT NULL,
    "ExtraProperties" text
);


ALTER TABLE public."AbpEntityChanges" OWNER TO jainil;

--
-- Name: AbpEntityPropertyChanges; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpEntityPropertyChanges" (
    "Id" uuid NOT NULL,
    "TenantId" uuid,
    "EntityChangeId" uuid NOT NULL,
    "NewValue" character varying(512),
    "OriginalValue" character varying(512),
    "PropertyName" character varying(128) NOT NULL,
    "PropertyTypeFullName" character varying(64) NOT NULL
);


ALTER TABLE public."AbpEntityPropertyChanges" OWNER TO jainil;

--
-- Name: AbpFeatureGroups; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpFeatureGroups" (
    "Id" uuid NOT NULL,
    "Name" character varying(128) NOT NULL,
    "DisplayName" character varying(256) NOT NULL,
    "ExtraProperties" text
);


ALTER TABLE public."AbpFeatureGroups" OWNER TO jainil;

--
-- Name: AbpFeatureValues; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpFeatureValues" (
    "Id" uuid NOT NULL,
    "Name" character varying(128) NOT NULL,
    "Value" character varying(128) NOT NULL,
    "ProviderName" character varying(64),
    "ProviderKey" character varying(64)
);


ALTER TABLE public."AbpFeatureValues" OWNER TO jainil;

--
-- Name: AbpFeatures; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpFeatures" (
    "Id" uuid NOT NULL,
    "GroupName" character varying(128) NOT NULL,
    "Name" character varying(128) NOT NULL,
    "ParentName" character varying(128),
    "DisplayName" character varying(256) NOT NULL,
    "Description" character varying(256),
    "DefaultValue" character varying(256),
    "IsVisibleToClients" boolean NOT NULL,
    "IsAvailableToHost" boolean NOT NULL,
    "AllowedProviders" character varying(256),
    "ValueType" character varying(2048),
    "ExtraProperties" text
);


ALTER TABLE public."AbpFeatures" OWNER TO jainil;

--
-- Name: AbpLinkUsers; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpLinkUsers" (
    "Id" uuid NOT NULL,
    "SourceUserId" uuid NOT NULL,
    "SourceTenantId" uuid,
    "TargetUserId" uuid NOT NULL,
    "TargetTenantId" uuid
);


ALTER TABLE public."AbpLinkUsers" OWNER TO jainil;

--
-- Name: AbpOrganizationUnitRoles; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpOrganizationUnitRoles" (
    "RoleId" uuid NOT NULL,
    "OrganizationUnitId" uuid NOT NULL,
    "TenantId" uuid,
    "CreationTime" timestamp without time zone NOT NULL,
    "CreatorId" uuid
);


ALTER TABLE public."AbpOrganizationUnitRoles" OWNER TO jainil;

--
-- Name: AbpOrganizationUnits; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpOrganizationUnits" (
    "Id" uuid NOT NULL,
    "TenantId" uuid,
    "ParentId" uuid,
    "Code" character varying(95) NOT NULL,
    "DisplayName" character varying(128) NOT NULL,
    "EntityVersion" integer NOT NULL,
    "ExtraProperties" text NOT NULL,
    "ConcurrencyStamp" character varying(40) NOT NULL,
    "CreationTime" timestamp without time zone NOT NULL,
    "CreatorId" uuid,
    "LastModificationTime" timestamp without time zone,
    "LastModifierId" uuid,
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeleterId" uuid,
    "DeletionTime" timestamp without time zone
);


ALTER TABLE public."AbpOrganizationUnits" OWNER TO jainil;

--
-- Name: AbpPermissionGrants; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpPermissionGrants" (
    "Id" uuid NOT NULL,
    "TenantId" uuid,
    "Name" character varying(128) NOT NULL,
    "ProviderName" character varying(64) NOT NULL,
    "ProviderKey" character varying(64) NOT NULL
);


ALTER TABLE public."AbpPermissionGrants" OWNER TO jainil;

--
-- Name: AbpPermissionGroups; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpPermissionGroups" (
    "Id" uuid NOT NULL,
    "Name" character varying(128) NOT NULL,
    "DisplayName" character varying(256) NOT NULL,
    "ExtraProperties" text
);


ALTER TABLE public."AbpPermissionGroups" OWNER TO jainil;

--
-- Name: AbpPermissions; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpPermissions" (
    "Id" uuid NOT NULL,
    "GroupName" character varying(128) NOT NULL,
    "Name" character varying(128) NOT NULL,
    "ParentName" character varying(128),
    "DisplayName" character varying(256) NOT NULL,
    "IsEnabled" boolean NOT NULL,
    "MultiTenancySide" smallint NOT NULL,
    "Providers" character varying(128),
    "StateCheckers" character varying(256),
    "ExtraProperties" text
);


ALTER TABLE public."AbpPermissions" OWNER TO jainil;

--
-- Name: AbpRoleClaims; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpRoleClaims" (
    "Id" uuid NOT NULL,
    "RoleId" uuid NOT NULL,
    "TenantId" uuid,
    "ClaimType" character varying(256) NOT NULL,
    "ClaimValue" character varying(1024)
);


ALTER TABLE public."AbpRoleClaims" OWNER TO jainil;

--
-- Name: AbpRoles; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpRoles" (
    "Id" uuid NOT NULL,
    "TenantId" uuid,
    "Name" character varying(256) NOT NULL,
    "NormalizedName" character varying(256) NOT NULL,
    "IsDefault" boolean NOT NULL,
    "IsStatic" boolean NOT NULL,
    "IsPublic" boolean NOT NULL,
    "EntityVersion" integer NOT NULL,
    "ExtraProperties" text NOT NULL,
    "ConcurrencyStamp" character varying(40) NOT NULL
);


ALTER TABLE public."AbpRoles" OWNER TO jainil;

--
-- Name: AbpSecurityLogs; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpSecurityLogs" (
    "Id" uuid NOT NULL,
    "TenantId" uuid,
    "ApplicationName" character varying(96),
    "Identity" character varying(96),
    "Action" character varying(96),
    "UserId" uuid,
    "UserName" character varying(256),
    "TenantName" character varying(64),
    "ClientId" character varying(64),
    "CorrelationId" character varying(64),
    "ClientIpAddress" character varying(64),
    "BrowserInfo" character varying(512),
    "CreationTime" timestamp without time zone NOT NULL,
    "ExtraProperties" text NOT NULL,
    "ConcurrencyStamp" character varying(40) NOT NULL
);


ALTER TABLE public."AbpSecurityLogs" OWNER TO jainil;

--
-- Name: AbpSettingDefinitions; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpSettingDefinitions" (
    "Id" uuid NOT NULL,
    "Name" character varying(128) NOT NULL,
    "DisplayName" character varying(256) NOT NULL,
    "Description" character varying(512),
    "DefaultValue" character varying(2048),
    "IsVisibleToClients" boolean NOT NULL,
    "Providers" character varying(1024),
    "IsInherited" boolean NOT NULL,
    "IsEncrypted" boolean NOT NULL,
    "ExtraProperties" text
);


ALTER TABLE public."AbpSettingDefinitions" OWNER TO jainil;

--
-- Name: AbpSettings; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpSettings" (
    "Id" uuid NOT NULL,
    "Name" character varying(128) NOT NULL,
    "Value" character varying(2048) NOT NULL,
    "ProviderName" character varying(64),
    "ProviderKey" character varying(64)
);


ALTER TABLE public."AbpSettings" OWNER TO jainil;

--
-- Name: AbpTenantConnectionStrings; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpTenantConnectionStrings" (
    "TenantId" uuid NOT NULL,
    "Name" character varying(64) NOT NULL,
    "Value" character varying(1024) NOT NULL
);


ALTER TABLE public."AbpTenantConnectionStrings" OWNER TO jainil;

--
-- Name: AbpTenants; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpTenants" (
    "Id" uuid NOT NULL,
    "Name" character varying(64) NOT NULL,
    "EntityVersion" integer NOT NULL,
    "ExtraProperties" text NOT NULL,
    "ConcurrencyStamp" character varying(40) NOT NULL,
    "CreationTime" timestamp without time zone NOT NULL,
    "CreatorId" uuid,
    "LastModificationTime" timestamp without time zone,
    "LastModifierId" uuid,
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeleterId" uuid,
    "DeletionTime" timestamp without time zone
);


ALTER TABLE public."AbpTenants" OWNER TO jainil;

--
-- Name: AbpUserClaims; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpUserClaims" (
    "Id" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "TenantId" uuid,
    "ClaimType" character varying(256) NOT NULL,
    "ClaimValue" character varying(1024)
);


ALTER TABLE public."AbpUserClaims" OWNER TO jainil;

--
-- Name: AbpUserDelegations; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpUserDelegations" (
    "Id" uuid NOT NULL,
    "TenantId" uuid,
    "SourceUserId" uuid NOT NULL,
    "TargetUserId" uuid NOT NULL,
    "StartTime" timestamp without time zone NOT NULL,
    "EndTime" timestamp without time zone NOT NULL
);


ALTER TABLE public."AbpUserDelegations" OWNER TO jainil;

--
-- Name: AbpUserLogins; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpUserLogins" (
    "UserId" uuid NOT NULL,
    "LoginProvider" character varying(64) NOT NULL,
    "TenantId" uuid,
    "ProviderKey" character varying(196) NOT NULL,
    "ProviderDisplayName" character varying(128)
);


ALTER TABLE public."AbpUserLogins" OWNER TO jainil;

--
-- Name: AbpUserOrganizationUnits; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpUserOrganizationUnits" (
    "UserId" uuid NOT NULL,
    "OrganizationUnitId" uuid NOT NULL,
    "TenantId" uuid,
    "CreationTime" timestamp without time zone NOT NULL,
    "CreatorId" uuid
);


ALTER TABLE public."AbpUserOrganizationUnits" OWNER TO jainil;

--
-- Name: AbpUserRoles; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpUserRoles" (
    "UserId" uuid NOT NULL,
    "RoleId" uuid NOT NULL,
    "TenantId" uuid
);


ALTER TABLE public."AbpUserRoles" OWNER TO jainil;

--
-- Name: AbpUserTokens; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpUserTokens" (
    "UserId" uuid NOT NULL,
    "LoginProvider" character varying(64) NOT NULL,
    "Name" character varying(128) NOT NULL,
    "TenantId" uuid,
    "Value" text
);


ALTER TABLE public."AbpUserTokens" OWNER TO jainil;

--
-- Name: AbpUsers; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AbpUsers" (
    "Id" uuid NOT NULL,
    "TenantId" uuid,
    "UserName" character varying(256) NOT NULL,
    "NormalizedUserName" character varying(256) NOT NULL,
    "Name" character varying(64),
    "Surname" character varying(64),
    "Email" character varying(256) NOT NULL,
    "NormalizedEmail" character varying(256) NOT NULL,
    "EmailConfirmed" boolean DEFAULT false NOT NULL,
    "PasswordHash" character varying(256),
    "SecurityStamp" character varying(256) NOT NULL,
    "IsExternal" boolean DEFAULT false NOT NULL,
    "PhoneNumber" character varying(16),
    "PhoneNumberConfirmed" boolean DEFAULT false NOT NULL,
    "IsActive" boolean NOT NULL,
    "TwoFactorEnabled" boolean DEFAULT false NOT NULL,
    "LockoutEnd" timestamp with time zone,
    "LockoutEnabled" boolean DEFAULT false NOT NULL,
    "AccessFailedCount" integer DEFAULT 0 NOT NULL,
    "ShouldChangePasswordOnNextLogin" boolean NOT NULL,
    "EntityVersion" integer NOT NULL,
    "LastPasswordChangeTime" timestamp with time zone,
    "ExtraProperties" text NOT NULL,
    "ConcurrencyStamp" character varying(40) NOT NULL,
    "CreationTime" timestamp without time zone NOT NULL,
    "CreatorId" uuid,
    "LastModificationTime" timestamp without time zone,
    "LastModifierId" uuid,
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeleterId" uuid,
    "DeletionTime" timestamp without time zone
);


ALTER TABLE public."AbpUsers" OWNER TO jainil;

--
-- Name: AuditHistories; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."AuditHistories" (
    "Id" uuid NOT NULL,
    "DateOfAudit" timestamp without time zone NOT NULL,
    "ReviewedBy" uuid NOT NULL,
    "Status" integer NOT NULL,
    "ReviewedSection" text NOT NULL,
    "CommentOrQueries" text,
    "ActionItem" text
);


ALTER TABLE public."AuditHistories" OWNER TO jainil;

--
-- Name: ClientFeedbacks; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."ClientFeedbacks" (
    "Id" uuid NOT NULL,
    "ProjectId" uuid NOT NULL,
    "FeedbackDate" timestamp without time zone NOT NULL,
    "FeedbackType" integer NOT NULL,
    "Details" text NOT NULL
);


ALTER TABLE public."ClientFeedbacks" OWNER TO jainil;

--
-- Name: DocumentVersions; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."DocumentVersions" (
    "Id" uuid NOT NULL,
    "ChangeType" integer NOT NULL,
    "Changes" text,
    "ChangeReason" text,
    "DocumentId" uuid NOT NULL,
    "ExtraProperties" text NOT NULL,
    "ConcurrencyStamp" character varying(40) NOT NULL,
    "CreationTime" timestamp without time zone NOT NULL,
    "CreatorId" uuid,
    "LastModificationTime" timestamp without time zone,
    "LastModifierId" uuid
);


ALTER TABLE public."DocumentVersions" OWNER TO jainil;

--
-- Name: Documents; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."Documents" (
    "Id" uuid NOT NULL,
    "Url" text NOT NULL,
    "Name" text NOT NULL,
    "Description" text NOT NULL,
    "ProjectId" uuid NOT NULL,
    "CreationTime" timestamp without time zone NOT NULL,
    "CreatorId" uuid,
    "LastModificationTime" timestamp without time zone,
    "LastModifierId" uuid
);


ALTER TABLE public."Documents" OWNER TO jainil;

--
-- Name: EscalationMatrices; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."EscalationMatrices" (
    "Id" uuid NOT NULL,
    "ResponsiblePerson" text NOT NULL,
    "Level" integer NOT NULL,
    "EscalationType" integer NOT NULL,
    "ProjectId" uuid NOT NULL,
    "CreationTime" timestamp without time zone NOT NULL,
    "CreatorId" uuid,
    "LastModificationTime" timestamp without time zone,
    "LastModifierId" uuid
);


ALTER TABLE public."EscalationMatrices" OWNER TO jainil;

--
-- Name: MeetingMinutes; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."MeetingMinutes" (
    "Id" uuid NOT NULL,
    "ProjectId" uuid NOT NULL,
    "MeetingDate" timestamp without time zone NOT NULL,
    "MoMLink" text NOT NULL,
    "Comments" text NOT NULL,
    "ExtraProperties" text NOT NULL,
    "ConcurrencyStamp" character varying(40) NOT NULL,
    "CreationTime" timestamp without time zone NOT NULL,
    "CreatorId" uuid,
    "LastModificationTime" timestamp without time zone,
    "LastModifierId" uuid
);


ALTER TABLE public."MeetingMinutes" OWNER TO jainil;

--
-- Name: OpenIddictApplications; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."OpenIddictApplications" (
    "Id" uuid NOT NULL,
    "ApplicationType" character varying(50),
    "ClientId" character varying(100),
    "ClientSecret" text,
    "ClientType" character varying(50),
    "ConsentType" character varying(50),
    "DisplayName" text,
    "DisplayNames" text,
    "JsonWebKeySet" text,
    "Permissions" text,
    "PostLogoutRedirectUris" text,
    "Properties" text,
    "RedirectUris" text,
    "Requirements" text,
    "Settings" text,
    "ClientUri" text,
    "LogoUri" text,
    "ExtraProperties" text NOT NULL,
    "ConcurrencyStamp" character varying(40) NOT NULL,
    "CreationTime" timestamp without time zone NOT NULL,
    "CreatorId" uuid,
    "LastModificationTime" timestamp without time zone,
    "LastModifierId" uuid,
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeleterId" uuid,
    "DeletionTime" timestamp without time zone
);


ALTER TABLE public."OpenIddictApplications" OWNER TO jainil;

--
-- Name: OpenIddictAuthorizations; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."OpenIddictAuthorizations" (
    "Id" uuid NOT NULL,
    "ApplicationId" uuid,
    "CreationDate" timestamp without time zone,
    "Properties" text,
    "Scopes" text,
    "Status" character varying(50),
    "Subject" character varying(400),
    "Type" character varying(50),
    "ExtraProperties" text NOT NULL,
    "ConcurrencyStamp" character varying(40) NOT NULL,
    "CreationTime" timestamp without time zone NOT NULL,
    "CreatorId" uuid,
    "LastModificationTime" timestamp without time zone,
    "LastModifierId" uuid,
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeleterId" uuid,
    "DeletionTime" timestamp without time zone
);


ALTER TABLE public."OpenIddictAuthorizations" OWNER TO jainil;

--
-- Name: OpenIddictScopes; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."OpenIddictScopes" (
    "Id" uuid NOT NULL,
    "Description" text,
    "Descriptions" text,
    "DisplayName" text,
    "DisplayNames" text,
    "Name" character varying(200),
    "Properties" text,
    "Resources" text,
    "ExtraProperties" text NOT NULL,
    "ConcurrencyStamp" character varying(40) NOT NULL,
    "CreationTime" timestamp without time zone NOT NULL,
    "CreatorId" uuid,
    "LastModificationTime" timestamp without time zone,
    "LastModifierId" uuid,
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeleterId" uuid,
    "DeletionTime" timestamp without time zone
);


ALTER TABLE public."OpenIddictScopes" OWNER TO jainil;

--
-- Name: OpenIddictTokens; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."OpenIddictTokens" (
    "Id" uuid NOT NULL,
    "ApplicationId" uuid,
    "AuthorizationId" uuid,
    "CreationDate" timestamp without time zone,
    "ExpirationDate" timestamp without time zone,
    "Payload" text,
    "Properties" text,
    "RedemptionDate" timestamp without time zone,
    "ReferenceId" character varying(100),
    "Status" character varying(50),
    "Subject" character varying(400),
    "Type" character varying(50),
    "ExtraProperties" text NOT NULL,
    "ConcurrencyStamp" character varying(40) NOT NULL,
    "CreationTime" timestamp without time zone NOT NULL,
    "CreatorId" uuid,
    "LastModificationTime" timestamp without time zone,
    "LastModifierId" uuid,
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeleterId" uuid,
    "DeletionTime" timestamp without time zone
);


ALTER TABLE public."OpenIddictTokens" OWNER TO jainil;

--
-- Name: Organizations; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."Organizations" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL,
    "TenantId" uuid
);


ALTER TABLE public."Organizations" OWNER TO jainil;

--
-- Name: PhaseMilestones; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."PhaseMilestones" (
    "Id" uuid NOT NULL,
    "ProjectId" uuid NOT NULL,
    "Title" text NOT NULL,
    "StartDate" timestamp without time zone NOT NULL,
    "EndDate" timestamp without time zone NOT NULL,
    "Description" text NOT NULL,
    "Comments" text NOT NULL,
    "Status" integer NOT NULL,
    "ExtraProperties" text NOT NULL,
    "ConcurrencyStamp" character varying(40) NOT NULL,
    "CreationTime" timestamp without time zone NOT NULL,
    "CreatorId" uuid,
    "LastModificationTime" timestamp without time zone,
    "LastModifierId" uuid
);


ALTER TABLE public."PhaseMilestones" OWNER TO jainil;

--
-- Name: ProjectBudgets; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."ProjectBudgets" (
    "Id" uuid NOT NULL,
    "Type" integer NOT NULL,
    "DurationInMonths" integer,
    "ContractDuration" integer,
    "BudgetedHours" integer,
    "BudgetedCost" double precision NOT NULL,
    "Currency" text NOT NULL,
    "ProjectId" uuid NOT NULL,
    "CreationTime" timestamp without time zone NOT NULL,
    "CreatorId" uuid,
    "LastModificationTime" timestamp without time zone,
    "LastModifierId" uuid
);


ALTER TABLE public."ProjectBudgets" OWNER TO jainil;

--
-- Name: ProjectResources; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."ProjectResources" (
    "Id" uuid NOT NULL,
    "ProjectId" uuid NOT NULL,
    "ResourceId" uuid NOT NULL,
    "Resource" uuid NOT NULL,
    "AllocationPercentage" double precision NOT NULL,
    "Start" timestamp without time zone NOT NULL,
    "End" timestamp without time zone NOT NULL,
    "Role" text NOT NULL,
    "ExtraProperties" text NOT NULL,
    "ConcurrencyStamp" character varying(40) NOT NULL,
    "CreationTime" timestamp without time zone NOT NULL,
    "CreatorId" uuid,
    "LastModificationTime" timestamp without time zone,
    "LastModifierId" uuid
);


ALTER TABLE public."ProjectResources" OWNER TO jainil;

--
-- Name: Projects; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."Projects" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL,
    "Description" text NOT NULL,
    "CreationTime" timestamp without time zone NOT NULL,
    "CreatorId" uuid,
    "LastModificationTime" timestamp without time zone,
    "LastModifierId" uuid
);


ALTER TABLE public."Projects" OWNER TO jainil;

--
-- Name: RemediationStep; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."RemediationStep" (
    "Id" uuid NOT NULL,
    "Description" text NOT NULL,
    "RiskProfileId" uuid NOT NULL,
    "ExtraProperties" text NOT NULL,
    "ConcurrencyStamp" character varying(40) NOT NULL,
    "CreationTime" timestamp without time zone NOT NULL,
    "CreatorId" uuid,
    "LastModificationTime" timestamp without time zone,
    "LastModifierId" uuid
);


ALTER TABLE public."RemediationStep" OWNER TO jainil;

--
-- Name: RiskProfiles; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."RiskProfiles" (
    "Id" uuid NOT NULL,
    "ProjectId" uuid NOT NULL,
    "RiskType" integer NOT NULL,
    "Severity" integer NOT NULL,
    "Impact" integer NOT NULL,
    "ExtraProperties" text NOT NULL,
    "ConcurrencyStamp" character varying(40) NOT NULL,
    "CreationTime" timestamp without time zone NOT NULL,
    "CreatorId" uuid,
    "LastModificationTime" timestamp without time zone,
    "LastModifierId" uuid
);


ALTER TABLE public."RiskProfiles" OWNER TO jainil;

--
-- Name: Sprints; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."Sprints" (
    "Id" uuid NOT NULL,
    "PhaseMilestoneId" uuid NOT NULL,
    "StartDate" timestamp without time zone NOT NULL,
    "EndDate" timestamp without time zone NOT NULL,
    "Status" integer NOT NULL,
    "Comments" text NOT NULL,
    "Goals" text NOT NULL,
    "SprintNumber" integer NOT NULL,
    "ExtraProperties" text NOT NULL,
    "ConcurrencyStamp" character varying(40) NOT NULL,
    "CreationTime" timestamp without time zone NOT NULL,
    "CreatorId" uuid,
    "LastModificationTime" timestamp without time zone,
    "LastModifierId" uuid
);


ALTER TABLE public."Sprints" OWNER TO jainil;

--
-- Name: Stakeholders; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."Stakeholders" (
    "Id" uuid NOT NULL,
    "Title" text NOT NULL,
    "Name" text NOT NULL,
    "Contact" text NOT NULL,
    "ProjectId" uuid NOT NULL,
    "CreationTime" timestamp without time zone NOT NULL,
    "CreatorId" uuid,
    "LastModificationTime" timestamp without time zone,
    "LastModifierId" uuid
);


ALTER TABLE public."Stakeholders" OWNER TO jainil;

--
-- Name: Users; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."Users" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL,
    "UserName" text NOT NULL,
    "Email" text NOT NULL,
    "Surname" text NOT NULL,
    "IsActive" boolean NOT NULL,
    "EmailConfirmed" boolean NOT NULL,
    "PhoneNumber" text NOT NULL,
    "PhoneNumberConfirmed" boolean NOT NULL,
    "TenantId" uuid,
    "ExtraProperties" text
);


ALTER TABLE public."Users" OWNER TO jainil;

--
-- Name: VersionHistories; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."VersionHistories" (
    "Id" uuid NOT NULL,
    "Version" integer NOT NULL,
    "Type" text NOT NULL,
    "Change" text NOT NULL,
    "ChangeReason" text NOT NULL,
    "CreatedBy" text NOT NULL,
    "RevisionDate" timestamp without time zone NOT NULL,
    "ApprovalDate" timestamp without time zone,
    "ApprovedBy" text NOT NULL,
    "CreationTime" timestamp without time zone NOT NULL,
    "CreatorId" uuid,
    "LastModificationTime" timestamp without time zone,
    "LastModifierId" uuid
);


ALTER TABLE public."VersionHistories" OWNER TO jainil;

--
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: jainil
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO jainil;

--
-- Data for Name: AbpAuditLogActions; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpAuditLogActions" ("Id", "TenantId", "AuditLogId", "ServiceName", "MethodName", "Parameters", "ExecutionTime", "ExecutionDuration", "ExtraProperties") FROM stdin;
\.


--
-- Data for Name: AbpAuditLogs; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpAuditLogs" ("Id", "ApplicationName", "UserId", "UserName", "TenantId", "TenantName", "ImpersonatorUserId", "ImpersonatorUserName", "ImpersonatorTenantId", "ImpersonatorTenantName", "ExecutionTime", "ExecutionDuration", "ClientIpAddress", "ClientName", "ClientId", "CorrelationId", "BrowserInfo", "HttpMethod", "Url", "Exceptions", "Comments", "HttpStatusCode", "ExtraProperties", "ConcurrencyStamp") FROM stdin;
\.


--
-- Data for Name: AbpClaimTypes; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpClaimTypes" ("Id", "Name", "Required", "IsStatic", "Regex", "RegexDescription", "Description", "ValueType", "ExtraProperties", "ConcurrencyStamp") FROM stdin;
\.


--
-- Data for Name: AbpEntityChanges; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpEntityChanges" ("Id", "AuditLogId", "TenantId", "ChangeTime", "ChangeType", "EntityTenantId", "EntityId", "EntityTypeFullName", "ExtraProperties") FROM stdin;
\.


--
-- Data for Name: AbpEntityPropertyChanges; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpEntityPropertyChanges" ("Id", "TenantId", "EntityChangeId", "NewValue", "OriginalValue", "PropertyName", "PropertyTypeFullName") FROM stdin;
\.


--
-- Data for Name: AbpFeatureGroups; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpFeatureGroups" ("Id", "Name", "DisplayName", "ExtraProperties") FROM stdin;
\.


--
-- Data for Name: AbpFeatureValues; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpFeatureValues" ("Id", "Name", "Value", "ProviderName", "ProviderKey") FROM stdin;
\.


--
-- Data for Name: AbpFeatures; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpFeatures" ("Id", "GroupName", "Name", "ParentName", "DisplayName", "Description", "DefaultValue", "IsVisibleToClients", "IsAvailableToHost", "AllowedProviders", "ValueType", "ExtraProperties") FROM stdin;
\.


--
-- Data for Name: AbpLinkUsers; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpLinkUsers" ("Id", "SourceUserId", "SourceTenantId", "TargetUserId", "TargetTenantId") FROM stdin;
\.


--
-- Data for Name: AbpOrganizationUnitRoles; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpOrganizationUnitRoles" ("RoleId", "OrganizationUnitId", "TenantId", "CreationTime", "CreatorId") FROM stdin;
\.


--
-- Data for Name: AbpOrganizationUnits; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpOrganizationUnits" ("Id", "TenantId", "ParentId", "Code", "DisplayName", "EntityVersion", "ExtraProperties", "ConcurrencyStamp", "CreationTime", "CreatorId", "LastModificationTime", "LastModifierId", "IsDeleted", "DeleterId", "DeletionTime") FROM stdin;
\.


--
-- Data for Name: AbpPermissionGrants; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpPermissionGrants" ("Id", "TenantId", "Name", "ProviderName", "ProviderKey") FROM stdin;
\.


--
-- Data for Name: AbpPermissionGroups; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpPermissionGroups" ("Id", "Name", "DisplayName", "ExtraProperties") FROM stdin;
\.


--
-- Data for Name: AbpPermissions; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpPermissions" ("Id", "GroupName", "Name", "ParentName", "DisplayName", "IsEnabled", "MultiTenancySide", "Providers", "StateCheckers", "ExtraProperties") FROM stdin;
\.


--
-- Data for Name: AbpRoleClaims; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpRoleClaims" ("Id", "RoleId", "TenantId", "ClaimType", "ClaimValue") FROM stdin;
\.


--
-- Data for Name: AbpRoles; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpRoles" ("Id", "TenantId", "Name", "NormalizedName", "IsDefault", "IsStatic", "IsPublic", "EntityVersion", "ExtraProperties", "ConcurrencyStamp") FROM stdin;
\.


--
-- Data for Name: AbpSecurityLogs; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpSecurityLogs" ("Id", "TenantId", "ApplicationName", "Identity", "Action", "UserId", "UserName", "TenantName", "ClientId", "CorrelationId", "ClientIpAddress", "BrowserInfo", "CreationTime", "ExtraProperties", "ConcurrencyStamp") FROM stdin;
\.


--
-- Data for Name: AbpSettingDefinitions; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpSettingDefinitions" ("Id", "Name", "DisplayName", "Description", "DefaultValue", "IsVisibleToClients", "Providers", "IsInherited", "IsEncrypted", "ExtraProperties") FROM stdin;
\.


--
-- Data for Name: AbpSettings; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpSettings" ("Id", "Name", "Value", "ProviderName", "ProviderKey") FROM stdin;
\.


--
-- Data for Name: AbpTenantConnectionStrings; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpTenantConnectionStrings" ("TenantId", "Name", "Value") FROM stdin;
\.


--
-- Data for Name: AbpTenants; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpTenants" ("Id", "Name", "EntityVersion", "ExtraProperties", "ConcurrencyStamp", "CreationTime", "CreatorId", "LastModificationTime", "LastModifierId", "IsDeleted", "DeleterId", "DeletionTime") FROM stdin;
\.


--
-- Data for Name: AbpUserClaims; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpUserClaims" ("Id", "UserId", "TenantId", "ClaimType", "ClaimValue") FROM stdin;
\.


--
-- Data for Name: AbpUserDelegations; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpUserDelegations" ("Id", "TenantId", "SourceUserId", "TargetUserId", "StartTime", "EndTime") FROM stdin;
\.


--
-- Data for Name: AbpUserLogins; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpUserLogins" ("UserId", "LoginProvider", "TenantId", "ProviderKey", "ProviderDisplayName") FROM stdin;
\.


--
-- Data for Name: AbpUserOrganizationUnits; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpUserOrganizationUnits" ("UserId", "OrganizationUnitId", "TenantId", "CreationTime", "CreatorId") FROM stdin;
\.


--
-- Data for Name: AbpUserRoles; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpUserRoles" ("UserId", "RoleId", "TenantId") FROM stdin;
\.


--
-- Data for Name: AbpUserTokens; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpUserTokens" ("UserId", "LoginProvider", "Name", "TenantId", "Value") FROM stdin;
\.


--
-- Data for Name: AbpUsers; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AbpUsers" ("Id", "TenantId", "UserName", "NormalizedUserName", "Name", "Surname", "Email", "NormalizedEmail", "EmailConfirmed", "PasswordHash", "SecurityStamp", "IsExternal", "PhoneNumber", "PhoneNumberConfirmed", "IsActive", "TwoFactorEnabled", "LockoutEnd", "LockoutEnabled", "AccessFailedCount", "ShouldChangePasswordOnNextLogin", "EntityVersion", "LastPasswordChangeTime", "ExtraProperties", "ConcurrencyStamp", "CreationTime", "CreatorId", "LastModificationTime", "LastModifierId", "IsDeleted", "DeleterId", "DeletionTime") FROM stdin;
\.


--
-- Data for Name: AuditHistories; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."AuditHistories" ("Id", "DateOfAudit", "ReviewedBy", "Status", "ReviewedSection", "CommentOrQueries", "ActionItem") FROM stdin;
\.


--
-- Data for Name: ClientFeedbacks; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."ClientFeedbacks" ("Id", "ProjectId", "FeedbackDate", "FeedbackType", "Details") FROM stdin;
\.


--
-- Data for Name: DocumentVersions; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."DocumentVersions" ("Id", "ChangeType", "Changes", "ChangeReason", "DocumentId", "ExtraProperties", "ConcurrencyStamp", "CreationTime", "CreatorId", "LastModificationTime", "LastModifierId") FROM stdin;
\.


--
-- Data for Name: Documents; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."Documents" ("Id", "Url", "Name", "Description", "ProjectId", "CreationTime", "CreatorId", "LastModificationTime", "LastModifierId") FROM stdin;
\.


--
-- Data for Name: EscalationMatrices; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."EscalationMatrices" ("Id", "ResponsiblePerson", "Level", "EscalationType", "ProjectId", "CreationTime", "CreatorId", "LastModificationTime", "LastModifierId") FROM stdin;
\.


--
-- Data for Name: MeetingMinutes; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."MeetingMinutes" ("Id", "ProjectId", "MeetingDate", "MoMLink", "Comments", "ExtraProperties", "ConcurrencyStamp", "CreationTime", "CreatorId", "LastModificationTime", "LastModifierId") FROM stdin;
\.


--
-- Data for Name: OpenIddictApplications; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."OpenIddictApplications" ("Id", "ApplicationType", "ClientId", "ClientSecret", "ClientType", "ConsentType", "DisplayName", "DisplayNames", "JsonWebKeySet", "Permissions", "PostLogoutRedirectUris", "Properties", "RedirectUris", "Requirements", "Settings", "ClientUri", "LogoUri", "ExtraProperties", "ConcurrencyStamp", "CreationTime", "CreatorId", "LastModificationTime", "LastModifierId", "IsDeleted", "DeleterId", "DeletionTime") FROM stdin;
\.


--
-- Data for Name: OpenIddictAuthorizations; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."OpenIddictAuthorizations" ("Id", "ApplicationId", "CreationDate", "Properties", "Scopes", "Status", "Subject", "Type", "ExtraProperties", "ConcurrencyStamp", "CreationTime", "CreatorId", "LastModificationTime", "LastModifierId", "IsDeleted", "DeleterId", "DeletionTime") FROM stdin;
\.


--
-- Data for Name: OpenIddictScopes; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."OpenIddictScopes" ("Id", "Description", "Descriptions", "DisplayName", "DisplayNames", "Name", "Properties", "Resources", "ExtraProperties", "ConcurrencyStamp", "CreationTime", "CreatorId", "LastModificationTime", "LastModifierId", "IsDeleted", "DeleterId", "DeletionTime") FROM stdin;
\.


--
-- Data for Name: OpenIddictTokens; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."OpenIddictTokens" ("Id", "ApplicationId", "AuthorizationId", "CreationDate", "ExpirationDate", "Payload", "Properties", "RedemptionDate", "ReferenceId", "Status", "Subject", "Type", "ExtraProperties", "ConcurrencyStamp", "CreationTime", "CreatorId", "LastModificationTime", "LastModifierId", "IsDeleted", "DeleterId", "DeletionTime") FROM stdin;
\.


--
-- Data for Name: Organizations; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."Organizations" ("Id", "Name", "TenantId") FROM stdin;
\.


--
-- Data for Name: PhaseMilestones; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."PhaseMilestones" ("Id", "ProjectId", "Title", "StartDate", "EndDate", "Description", "Comments", "Status", "ExtraProperties", "ConcurrencyStamp", "CreationTime", "CreatorId", "LastModificationTime", "LastModifierId") FROM stdin;
\.


--
-- Data for Name: ProjectBudgets; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."ProjectBudgets" ("Id", "Type", "DurationInMonths", "ContractDuration", "BudgetedHours", "BudgetedCost", "Currency", "ProjectId", "CreationTime", "CreatorId", "LastModificationTime", "LastModifierId") FROM stdin;
\.


--
-- Data for Name: ProjectResources; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."ProjectResources" ("Id", "ProjectId", "ResourceId", "Resource", "AllocationPercentage", "Start", "End", "Role", "ExtraProperties", "ConcurrencyStamp", "CreationTime", "CreatorId", "LastModificationTime", "LastModifierId") FROM stdin;
\.


--
-- Data for Name: Projects; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."Projects" ("Id", "Name", "Description", "CreationTime", "CreatorId", "LastModificationTime", "LastModifierId") FROM stdin;
\.


--
-- Data for Name: RemediationStep; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."RemediationStep" ("Id", "Description", "RiskProfileId", "ExtraProperties", "ConcurrencyStamp", "CreationTime", "CreatorId", "LastModificationTime", "LastModifierId") FROM stdin;
\.


--
-- Data for Name: RiskProfiles; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."RiskProfiles" ("Id", "ProjectId", "RiskType", "Severity", "Impact", "ExtraProperties", "ConcurrencyStamp", "CreationTime", "CreatorId", "LastModificationTime", "LastModifierId") FROM stdin;
\.


--
-- Data for Name: Sprints; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."Sprints" ("Id", "PhaseMilestoneId", "StartDate", "EndDate", "Status", "Comments", "Goals", "SprintNumber", "ExtraProperties", "ConcurrencyStamp", "CreationTime", "CreatorId", "LastModificationTime", "LastModifierId") FROM stdin;
\.


--
-- Data for Name: Stakeholders; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."Stakeholders" ("Id", "Title", "Name", "Contact", "ProjectId", "CreationTime", "CreatorId", "LastModificationTime", "LastModifierId") FROM stdin;
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."Users" ("Id", "Name", "UserName", "Email", "Surname", "IsActive", "EmailConfirmed", "PhoneNumber", "PhoneNumberConfirmed", "TenantId", "ExtraProperties") FROM stdin;
\.


--
-- Data for Name: VersionHistories; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."VersionHistories" ("Id", "Version", "Type", "Change", "ChangeReason", "CreatedBy", "RevisionDate", "ApprovalDate", "ApprovedBy", "CreationTime", "CreatorId", "LastModificationTime", "LastModifierId") FROM stdin;
\.


--
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: jainil
--

COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
20240304044028_Fixing version history	8.0.2
20240304120105_Test	8.0.2
20240304124939_Initial202020	8.0.2
\.


--
-- Name: AbpAuditLogActions PK_AbpAuditLogActions; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpAuditLogActions"
    ADD CONSTRAINT "PK_AbpAuditLogActions" PRIMARY KEY ("Id");


--
-- Name: AbpAuditLogs PK_AbpAuditLogs; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpAuditLogs"
    ADD CONSTRAINT "PK_AbpAuditLogs" PRIMARY KEY ("Id");


--
-- Name: AbpClaimTypes PK_AbpClaimTypes; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpClaimTypes"
    ADD CONSTRAINT "PK_AbpClaimTypes" PRIMARY KEY ("Id");


--
-- Name: AbpEntityChanges PK_AbpEntityChanges; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpEntityChanges"
    ADD CONSTRAINT "PK_AbpEntityChanges" PRIMARY KEY ("Id");


--
-- Name: AbpEntityPropertyChanges PK_AbpEntityPropertyChanges; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpEntityPropertyChanges"
    ADD CONSTRAINT "PK_AbpEntityPropertyChanges" PRIMARY KEY ("Id");


--
-- Name: AbpFeatureGroups PK_AbpFeatureGroups; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpFeatureGroups"
    ADD CONSTRAINT "PK_AbpFeatureGroups" PRIMARY KEY ("Id");


--
-- Name: AbpFeatureValues PK_AbpFeatureValues; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpFeatureValues"
    ADD CONSTRAINT "PK_AbpFeatureValues" PRIMARY KEY ("Id");


--
-- Name: AbpFeatures PK_AbpFeatures; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpFeatures"
    ADD CONSTRAINT "PK_AbpFeatures" PRIMARY KEY ("Id");


--
-- Name: AbpLinkUsers PK_AbpLinkUsers; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpLinkUsers"
    ADD CONSTRAINT "PK_AbpLinkUsers" PRIMARY KEY ("Id");


--
-- Name: AbpOrganizationUnitRoles PK_AbpOrganizationUnitRoles; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpOrganizationUnitRoles"
    ADD CONSTRAINT "PK_AbpOrganizationUnitRoles" PRIMARY KEY ("OrganizationUnitId", "RoleId");


--
-- Name: AbpOrganizationUnits PK_AbpOrganizationUnits; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpOrganizationUnits"
    ADD CONSTRAINT "PK_AbpOrganizationUnits" PRIMARY KEY ("Id");


--
-- Name: AbpPermissionGrants PK_AbpPermissionGrants; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpPermissionGrants"
    ADD CONSTRAINT "PK_AbpPermissionGrants" PRIMARY KEY ("Id");


--
-- Name: AbpPermissionGroups PK_AbpPermissionGroups; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpPermissionGroups"
    ADD CONSTRAINT "PK_AbpPermissionGroups" PRIMARY KEY ("Id");


--
-- Name: AbpPermissions PK_AbpPermissions; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpPermissions"
    ADD CONSTRAINT "PK_AbpPermissions" PRIMARY KEY ("Id");


--
-- Name: AbpRoleClaims PK_AbpRoleClaims; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpRoleClaims"
    ADD CONSTRAINT "PK_AbpRoleClaims" PRIMARY KEY ("Id");


--
-- Name: AbpRoles PK_AbpRoles; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpRoles"
    ADD CONSTRAINT "PK_AbpRoles" PRIMARY KEY ("Id");


--
-- Name: AbpSecurityLogs PK_AbpSecurityLogs; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpSecurityLogs"
    ADD CONSTRAINT "PK_AbpSecurityLogs" PRIMARY KEY ("Id");


--
-- Name: AbpSettingDefinitions PK_AbpSettingDefinitions; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpSettingDefinitions"
    ADD CONSTRAINT "PK_AbpSettingDefinitions" PRIMARY KEY ("Id");


--
-- Name: AbpSettings PK_AbpSettings; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpSettings"
    ADD CONSTRAINT "PK_AbpSettings" PRIMARY KEY ("Id");


--
-- Name: AbpTenantConnectionStrings PK_AbpTenantConnectionStrings; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpTenantConnectionStrings"
    ADD CONSTRAINT "PK_AbpTenantConnectionStrings" PRIMARY KEY ("TenantId", "Name");


--
-- Name: AbpTenants PK_AbpTenants; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpTenants"
    ADD CONSTRAINT "PK_AbpTenants" PRIMARY KEY ("Id");


--
-- Name: AbpUserClaims PK_AbpUserClaims; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpUserClaims"
    ADD CONSTRAINT "PK_AbpUserClaims" PRIMARY KEY ("Id");


--
-- Name: AbpUserDelegations PK_AbpUserDelegations; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpUserDelegations"
    ADD CONSTRAINT "PK_AbpUserDelegations" PRIMARY KEY ("Id");


--
-- Name: AbpUserLogins PK_AbpUserLogins; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpUserLogins"
    ADD CONSTRAINT "PK_AbpUserLogins" PRIMARY KEY ("UserId", "LoginProvider");


--
-- Name: AbpUserOrganizationUnits PK_AbpUserOrganizationUnits; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpUserOrganizationUnits"
    ADD CONSTRAINT "PK_AbpUserOrganizationUnits" PRIMARY KEY ("OrganizationUnitId", "UserId");


--
-- Name: AbpUserRoles PK_AbpUserRoles; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpUserRoles"
    ADD CONSTRAINT "PK_AbpUserRoles" PRIMARY KEY ("UserId", "RoleId");


--
-- Name: AbpUserTokens PK_AbpUserTokens; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpUserTokens"
    ADD CONSTRAINT "PK_AbpUserTokens" PRIMARY KEY ("UserId", "LoginProvider", "Name");


--
-- Name: AbpUsers PK_AbpUsers; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpUsers"
    ADD CONSTRAINT "PK_AbpUsers" PRIMARY KEY ("Id");


--
-- Name: AuditHistories PK_AuditHistories; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AuditHistories"
    ADD CONSTRAINT "PK_AuditHistories" PRIMARY KEY ("Id");


--
-- Name: ClientFeedbacks PK_ClientFeedbacks; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."ClientFeedbacks"
    ADD CONSTRAINT "PK_ClientFeedbacks" PRIMARY KEY ("Id");


--
-- Name: DocumentVersions PK_DocumentVersions; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."DocumentVersions"
    ADD CONSTRAINT "PK_DocumentVersions" PRIMARY KEY ("Id");


--
-- Name: Documents PK_Documents; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."Documents"
    ADD CONSTRAINT "PK_Documents" PRIMARY KEY ("Id");


--
-- Name: EscalationMatrices PK_EscalationMatrices; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."EscalationMatrices"
    ADD CONSTRAINT "PK_EscalationMatrices" PRIMARY KEY ("Id");


--
-- Name: MeetingMinutes PK_MeetingMinutes; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."MeetingMinutes"
    ADD CONSTRAINT "PK_MeetingMinutes" PRIMARY KEY ("Id");


--
-- Name: OpenIddictApplications PK_OpenIddictApplications; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."OpenIddictApplications"
    ADD CONSTRAINT "PK_OpenIddictApplications" PRIMARY KEY ("Id");


--
-- Name: OpenIddictAuthorizations PK_OpenIddictAuthorizations; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."OpenIddictAuthorizations"
    ADD CONSTRAINT "PK_OpenIddictAuthorizations" PRIMARY KEY ("Id");


--
-- Name: OpenIddictScopes PK_OpenIddictScopes; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."OpenIddictScopes"
    ADD CONSTRAINT "PK_OpenIddictScopes" PRIMARY KEY ("Id");


--
-- Name: OpenIddictTokens PK_OpenIddictTokens; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."OpenIddictTokens"
    ADD CONSTRAINT "PK_OpenIddictTokens" PRIMARY KEY ("Id");


--
-- Name: Organizations PK_Organizations; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."Organizations"
    ADD CONSTRAINT "PK_Organizations" PRIMARY KEY ("Id");


--
-- Name: PhaseMilestones PK_PhaseMilestones; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."PhaseMilestones"
    ADD CONSTRAINT "PK_PhaseMilestones" PRIMARY KEY ("Id");


--
-- Name: ProjectBudgets PK_ProjectBudgets; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."ProjectBudgets"
    ADD CONSTRAINT "PK_ProjectBudgets" PRIMARY KEY ("Id");


--
-- Name: ProjectResources PK_ProjectResources; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."ProjectResources"
    ADD CONSTRAINT "PK_ProjectResources" PRIMARY KEY ("Id");


--
-- Name: Projects PK_Projects; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."Projects"
    ADD CONSTRAINT "PK_Projects" PRIMARY KEY ("Id");


--
-- Name: RemediationStep PK_RemediationStep; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."RemediationStep"
    ADD CONSTRAINT "PK_RemediationStep" PRIMARY KEY ("Id");


--
-- Name: RiskProfiles PK_RiskProfiles; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."RiskProfiles"
    ADD CONSTRAINT "PK_RiskProfiles" PRIMARY KEY ("Id");


--
-- Name: Sprints PK_Sprints; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."Sprints"
    ADD CONSTRAINT "PK_Sprints" PRIMARY KEY ("Id");


--
-- Name: Stakeholders PK_Stakeholders; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."Stakeholders"
    ADD CONSTRAINT "PK_Stakeholders" PRIMARY KEY ("Id");


--
-- Name: Users PK_Users; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "PK_Users" PRIMARY KEY ("Id");


--
-- Name: VersionHistories PK_VersionHistories; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."VersionHistories"
    ADD CONSTRAINT "PK_VersionHistories" PRIMARY KEY ("Id");


--
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- Name: IX_AbpAuditLogActions_AuditLogId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpAuditLogActions_AuditLogId" ON public."AbpAuditLogActions" USING btree ("AuditLogId");


--
-- Name: IX_AbpAuditLogActions_TenantId_ServiceName_MethodName_Executio~; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpAuditLogActions_TenantId_ServiceName_MethodName_Executio~" ON public."AbpAuditLogActions" USING btree ("TenantId", "ServiceName", "MethodName", "ExecutionTime");


--
-- Name: IX_AbpAuditLogs_TenantId_ExecutionTime; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpAuditLogs_TenantId_ExecutionTime" ON public."AbpAuditLogs" USING btree ("TenantId", "ExecutionTime");


--
-- Name: IX_AbpAuditLogs_TenantId_UserId_ExecutionTime; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpAuditLogs_TenantId_UserId_ExecutionTime" ON public."AbpAuditLogs" USING btree ("TenantId", "UserId", "ExecutionTime");


--
-- Name: IX_AbpEntityChanges_AuditLogId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpEntityChanges_AuditLogId" ON public."AbpEntityChanges" USING btree ("AuditLogId");


--
-- Name: IX_AbpEntityChanges_TenantId_EntityTypeFullName_EntityId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpEntityChanges_TenantId_EntityTypeFullName_EntityId" ON public."AbpEntityChanges" USING btree ("TenantId", "EntityTypeFullName", "EntityId");


--
-- Name: IX_AbpEntityPropertyChanges_EntityChangeId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpEntityPropertyChanges_EntityChangeId" ON public."AbpEntityPropertyChanges" USING btree ("EntityChangeId");


--
-- Name: IX_AbpFeatureGroups_Name; Type: INDEX; Schema: public; Owner: jainil
--

CREATE UNIQUE INDEX "IX_AbpFeatureGroups_Name" ON public."AbpFeatureGroups" USING btree ("Name");


--
-- Name: IX_AbpFeatureValues_Name_ProviderName_ProviderKey; Type: INDEX; Schema: public; Owner: jainil
--

CREATE UNIQUE INDEX "IX_AbpFeatureValues_Name_ProviderName_ProviderKey" ON public."AbpFeatureValues" USING btree ("Name", "ProviderName", "ProviderKey");


--
-- Name: IX_AbpFeatures_GroupName; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpFeatures_GroupName" ON public."AbpFeatures" USING btree ("GroupName");


--
-- Name: IX_AbpFeatures_Name; Type: INDEX; Schema: public; Owner: jainil
--

CREATE UNIQUE INDEX "IX_AbpFeatures_Name" ON public."AbpFeatures" USING btree ("Name");


--
-- Name: IX_AbpLinkUsers_SourceUserId_SourceTenantId_TargetUserId_Targe~; Type: INDEX; Schema: public; Owner: jainil
--

CREATE UNIQUE INDEX "IX_AbpLinkUsers_SourceUserId_SourceTenantId_TargetUserId_Targe~" ON public."AbpLinkUsers" USING btree ("SourceUserId", "SourceTenantId", "TargetUserId", "TargetTenantId");


--
-- Name: IX_AbpOrganizationUnitRoles_RoleId_OrganizationUnitId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpOrganizationUnitRoles_RoleId_OrganizationUnitId" ON public."AbpOrganizationUnitRoles" USING btree ("RoleId", "OrganizationUnitId");


--
-- Name: IX_AbpOrganizationUnits_Code; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpOrganizationUnits_Code" ON public."AbpOrganizationUnits" USING btree ("Code");


--
-- Name: IX_AbpOrganizationUnits_ParentId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpOrganizationUnits_ParentId" ON public."AbpOrganizationUnits" USING btree ("ParentId");


--
-- Name: IX_AbpPermissionGrants_TenantId_Name_ProviderName_ProviderKey; Type: INDEX; Schema: public; Owner: jainil
--

CREATE UNIQUE INDEX "IX_AbpPermissionGrants_TenantId_Name_ProviderName_ProviderKey" ON public."AbpPermissionGrants" USING btree ("TenantId", "Name", "ProviderName", "ProviderKey");


--
-- Name: IX_AbpPermissionGroups_Name; Type: INDEX; Schema: public; Owner: jainil
--

CREATE UNIQUE INDEX "IX_AbpPermissionGroups_Name" ON public."AbpPermissionGroups" USING btree ("Name");


--
-- Name: IX_AbpPermissions_GroupName; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpPermissions_GroupName" ON public."AbpPermissions" USING btree ("GroupName");


--
-- Name: IX_AbpPermissions_Name; Type: INDEX; Schema: public; Owner: jainil
--

CREATE UNIQUE INDEX "IX_AbpPermissions_Name" ON public."AbpPermissions" USING btree ("Name");


--
-- Name: IX_AbpRoleClaims_RoleId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpRoleClaims_RoleId" ON public."AbpRoleClaims" USING btree ("RoleId");


--
-- Name: IX_AbpRoles_NormalizedName; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpRoles_NormalizedName" ON public."AbpRoles" USING btree ("NormalizedName");


--
-- Name: IX_AbpSecurityLogs_TenantId_Action; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpSecurityLogs_TenantId_Action" ON public."AbpSecurityLogs" USING btree ("TenantId", "Action");


--
-- Name: IX_AbpSecurityLogs_TenantId_ApplicationName; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpSecurityLogs_TenantId_ApplicationName" ON public."AbpSecurityLogs" USING btree ("TenantId", "ApplicationName");


--
-- Name: IX_AbpSecurityLogs_TenantId_Identity; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpSecurityLogs_TenantId_Identity" ON public."AbpSecurityLogs" USING btree ("TenantId", "Identity");


--
-- Name: IX_AbpSecurityLogs_TenantId_UserId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpSecurityLogs_TenantId_UserId" ON public."AbpSecurityLogs" USING btree ("TenantId", "UserId");


--
-- Name: IX_AbpSettingDefinitions_Name; Type: INDEX; Schema: public; Owner: jainil
--

CREATE UNIQUE INDEX "IX_AbpSettingDefinitions_Name" ON public."AbpSettingDefinitions" USING btree ("Name");


--
-- Name: IX_AbpSettings_Name_ProviderName_ProviderKey; Type: INDEX; Schema: public; Owner: jainil
--

CREATE UNIQUE INDEX "IX_AbpSettings_Name_ProviderName_ProviderKey" ON public."AbpSettings" USING btree ("Name", "ProviderName", "ProviderKey");


--
-- Name: IX_AbpTenants_Name; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpTenants_Name" ON public."AbpTenants" USING btree ("Name");


--
-- Name: IX_AbpUserClaims_UserId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpUserClaims_UserId" ON public."AbpUserClaims" USING btree ("UserId");


--
-- Name: IX_AbpUserLogins_LoginProvider_ProviderKey; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpUserLogins_LoginProvider_ProviderKey" ON public."AbpUserLogins" USING btree ("LoginProvider", "ProviderKey");


--
-- Name: IX_AbpUserOrganizationUnits_UserId_OrganizationUnitId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpUserOrganizationUnits_UserId_OrganizationUnitId" ON public."AbpUserOrganizationUnits" USING btree ("UserId", "OrganizationUnitId");


--
-- Name: IX_AbpUserRoles_RoleId_UserId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpUserRoles_RoleId_UserId" ON public."AbpUserRoles" USING btree ("RoleId", "UserId");


--
-- Name: IX_AbpUsers_Email; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpUsers_Email" ON public."AbpUsers" USING btree ("Email");


--
-- Name: IX_AbpUsers_NormalizedEmail; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpUsers_NormalizedEmail" ON public."AbpUsers" USING btree ("NormalizedEmail");


--
-- Name: IX_AbpUsers_NormalizedUserName; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpUsers_NormalizedUserName" ON public."AbpUsers" USING btree ("NormalizedUserName");


--
-- Name: IX_AbpUsers_UserName; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_AbpUsers_UserName" ON public."AbpUsers" USING btree ("UserName");


--
-- Name: IX_ClientFeedbacks_ProjectId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_ClientFeedbacks_ProjectId" ON public."ClientFeedbacks" USING btree ("ProjectId");


--
-- Name: IX_DocumentVersions_CreatorId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_DocumentVersions_CreatorId" ON public."DocumentVersions" USING btree ("CreatorId");


--
-- Name: IX_DocumentVersions_DocumentId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_DocumentVersions_DocumentId" ON public."DocumentVersions" USING btree ("DocumentId");


--
-- Name: IX_DocumentVersions_LastModifierId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_DocumentVersions_LastModifierId" ON public."DocumentVersions" USING btree ("LastModifierId");


--
-- Name: IX_Documents_ProjectId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_Documents_ProjectId" ON public."Documents" USING btree ("ProjectId");


--
-- Name: IX_EscalationMatrices_ProjectId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_EscalationMatrices_ProjectId" ON public."EscalationMatrices" USING btree ("ProjectId");


--
-- Name: IX_MeetingMinutes_CreatorId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_MeetingMinutes_CreatorId" ON public."MeetingMinutes" USING btree ("CreatorId");


--
-- Name: IX_MeetingMinutes_LastModifierId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_MeetingMinutes_LastModifierId" ON public."MeetingMinutes" USING btree ("LastModifierId");


--
-- Name: IX_MeetingMinutes_ProjectId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_MeetingMinutes_ProjectId" ON public."MeetingMinutes" USING btree ("ProjectId");


--
-- Name: IX_OpenIddictApplications_ClientId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_OpenIddictApplications_ClientId" ON public."OpenIddictApplications" USING btree ("ClientId");


--
-- Name: IX_OpenIddictAuthorizations_ApplicationId_Status_Subject_Type; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_OpenIddictAuthorizations_ApplicationId_Status_Subject_Type" ON public."OpenIddictAuthorizations" USING btree ("ApplicationId", "Status", "Subject", "Type");


--
-- Name: IX_OpenIddictScopes_Name; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_OpenIddictScopes_Name" ON public."OpenIddictScopes" USING btree ("Name");


--
-- Name: IX_OpenIddictTokens_ApplicationId_Status_Subject_Type; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_OpenIddictTokens_ApplicationId_Status_Subject_Type" ON public."OpenIddictTokens" USING btree ("ApplicationId", "Status", "Subject", "Type");


--
-- Name: IX_OpenIddictTokens_AuthorizationId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_OpenIddictTokens_AuthorizationId" ON public."OpenIddictTokens" USING btree ("AuthorizationId");


--
-- Name: IX_OpenIddictTokens_ReferenceId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_OpenIddictTokens_ReferenceId" ON public."OpenIddictTokens" USING btree ("ReferenceId");


--
-- Name: IX_PhaseMilestones_CreatorId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_PhaseMilestones_CreatorId" ON public."PhaseMilestones" USING btree ("CreatorId");


--
-- Name: IX_PhaseMilestones_LastModifierId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_PhaseMilestones_LastModifierId" ON public."PhaseMilestones" USING btree ("LastModifierId");


--
-- Name: IX_PhaseMilestones_ProjectId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_PhaseMilestones_ProjectId" ON public."PhaseMilestones" USING btree ("ProjectId");


--
-- Name: IX_ProjectBudgets_CreatorId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_ProjectBudgets_CreatorId" ON public."ProjectBudgets" USING btree ("CreatorId");


--
-- Name: IX_ProjectBudgets_LastModifierId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_ProjectBudgets_LastModifierId" ON public."ProjectBudgets" USING btree ("LastModifierId");


--
-- Name: IX_ProjectBudgets_ProjectId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_ProjectBudgets_ProjectId" ON public."ProjectBudgets" USING btree ("ProjectId");


--
-- Name: IX_ProjectResources_CreatorId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_ProjectResources_CreatorId" ON public."ProjectResources" USING btree ("CreatorId");


--
-- Name: IX_ProjectResources_LastModifierId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_ProjectResources_LastModifierId" ON public."ProjectResources" USING btree ("LastModifierId");


--
-- Name: IX_ProjectResources_ProjectId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_ProjectResources_ProjectId" ON public."ProjectResources" USING btree ("ProjectId");


--
-- Name: IX_RemediationStep_CreatorId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_RemediationStep_CreatorId" ON public."RemediationStep" USING btree ("CreatorId");


--
-- Name: IX_RemediationStep_LastModifierId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_RemediationStep_LastModifierId" ON public."RemediationStep" USING btree ("LastModifierId");


--
-- Name: IX_RemediationStep_RiskProfileId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_RemediationStep_RiskProfileId" ON public."RemediationStep" USING btree ("RiskProfileId");


--
-- Name: IX_RiskProfiles_CreatorId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_RiskProfiles_CreatorId" ON public."RiskProfiles" USING btree ("CreatorId");


--
-- Name: IX_RiskProfiles_LastModifierId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_RiskProfiles_LastModifierId" ON public."RiskProfiles" USING btree ("LastModifierId");


--
-- Name: IX_RiskProfiles_ProjectId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_RiskProfiles_ProjectId" ON public."RiskProfiles" USING btree ("ProjectId");


--
-- Name: IX_Sprints_CreatorId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_Sprints_CreatorId" ON public."Sprints" USING btree ("CreatorId");


--
-- Name: IX_Sprints_LastModifierId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_Sprints_LastModifierId" ON public."Sprints" USING btree ("LastModifierId");


--
-- Name: IX_Sprints_PhaseMilestoneId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_Sprints_PhaseMilestoneId" ON public."Sprints" USING btree ("PhaseMilestoneId");


--
-- Name: IX_Stakeholders_ProjectId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_Stakeholders_ProjectId" ON public."Stakeholders" USING btree ("ProjectId");


--
-- Name: IX_Users_TenantId; Type: INDEX; Schema: public; Owner: jainil
--

CREATE INDEX "IX_Users_TenantId" ON public."Users" USING btree ("TenantId");


--
-- Name: AbpAuditLogActions FK_AbpAuditLogActions_AbpAuditLogs_AuditLogId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpAuditLogActions"
    ADD CONSTRAINT "FK_AbpAuditLogActions_AbpAuditLogs_AuditLogId" FOREIGN KEY ("AuditLogId") REFERENCES public."AbpAuditLogs"("Id") ON DELETE CASCADE;


--
-- Name: AbpEntityChanges FK_AbpEntityChanges_AbpAuditLogs_AuditLogId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpEntityChanges"
    ADD CONSTRAINT "FK_AbpEntityChanges_AbpAuditLogs_AuditLogId" FOREIGN KEY ("AuditLogId") REFERENCES public."AbpAuditLogs"("Id") ON DELETE CASCADE;


--
-- Name: AbpEntityPropertyChanges FK_AbpEntityPropertyChanges_AbpEntityChanges_EntityChangeId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpEntityPropertyChanges"
    ADD CONSTRAINT "FK_AbpEntityPropertyChanges_AbpEntityChanges_EntityChangeId" FOREIGN KEY ("EntityChangeId") REFERENCES public."AbpEntityChanges"("Id") ON DELETE CASCADE;


--
-- Name: AbpOrganizationUnitRoles FK_AbpOrganizationUnitRoles_AbpOrganizationUnits_OrganizationU~; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpOrganizationUnitRoles"
    ADD CONSTRAINT "FK_AbpOrganizationUnitRoles_AbpOrganizationUnits_OrganizationU~" FOREIGN KEY ("OrganizationUnitId") REFERENCES public."AbpOrganizationUnits"("Id") ON DELETE CASCADE;


--
-- Name: AbpOrganizationUnitRoles FK_AbpOrganizationUnitRoles_AbpRoles_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpOrganizationUnitRoles"
    ADD CONSTRAINT "FK_AbpOrganizationUnitRoles_AbpRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES public."AbpRoles"("Id") ON DELETE CASCADE;


--
-- Name: AbpOrganizationUnits FK_AbpOrganizationUnits_AbpOrganizationUnits_ParentId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpOrganizationUnits"
    ADD CONSTRAINT "FK_AbpOrganizationUnits_AbpOrganizationUnits_ParentId" FOREIGN KEY ("ParentId") REFERENCES public."AbpOrganizationUnits"("Id");


--
-- Name: AbpRoleClaims FK_AbpRoleClaims_AbpRoles_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpRoleClaims"
    ADD CONSTRAINT "FK_AbpRoleClaims_AbpRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES public."AbpRoles"("Id") ON DELETE CASCADE;


--
-- Name: AbpTenantConnectionStrings FK_AbpTenantConnectionStrings_AbpTenants_TenantId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpTenantConnectionStrings"
    ADD CONSTRAINT "FK_AbpTenantConnectionStrings_AbpTenants_TenantId" FOREIGN KEY ("TenantId") REFERENCES public."AbpTenants"("Id") ON DELETE CASCADE;


--
-- Name: AbpUserClaims FK_AbpUserClaims_AbpUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpUserClaims"
    ADD CONSTRAINT "FK_AbpUserClaims_AbpUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AbpUsers"("Id") ON DELETE CASCADE;


--
-- Name: AbpUserLogins FK_AbpUserLogins_AbpUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpUserLogins"
    ADD CONSTRAINT "FK_AbpUserLogins_AbpUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AbpUsers"("Id") ON DELETE CASCADE;


--
-- Name: AbpUserOrganizationUnits FK_AbpUserOrganizationUnits_AbpOrganizationUnits_OrganizationU~; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpUserOrganizationUnits"
    ADD CONSTRAINT "FK_AbpUserOrganizationUnits_AbpOrganizationUnits_OrganizationU~" FOREIGN KEY ("OrganizationUnitId") REFERENCES public."AbpOrganizationUnits"("Id") ON DELETE CASCADE;


--
-- Name: AbpUserOrganizationUnits FK_AbpUserOrganizationUnits_AbpUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpUserOrganizationUnits"
    ADD CONSTRAINT "FK_AbpUserOrganizationUnits_AbpUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AbpUsers"("Id") ON DELETE CASCADE;


--
-- Name: AbpUserRoles FK_AbpUserRoles_AbpRoles_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpUserRoles"
    ADD CONSTRAINT "FK_AbpUserRoles_AbpRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES public."AbpRoles"("Id") ON DELETE CASCADE;


--
-- Name: AbpUserRoles FK_AbpUserRoles_AbpUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpUserRoles"
    ADD CONSTRAINT "FK_AbpUserRoles_AbpUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AbpUsers"("Id") ON DELETE CASCADE;


--
-- Name: AbpUserTokens FK_AbpUserTokens_AbpUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."AbpUserTokens"
    ADD CONSTRAINT "FK_AbpUserTokens_AbpUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AbpUsers"("Id") ON DELETE CASCADE;


--
-- Name: ClientFeedbacks FK_ClientFeedbacks_Projects_ProjectId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."ClientFeedbacks"
    ADD CONSTRAINT "FK_ClientFeedbacks_Projects_ProjectId" FOREIGN KEY ("ProjectId") REFERENCES public."Projects"("Id") ON DELETE CASCADE;


--
-- Name: DocumentVersions FK_DocumentVersions_Documents_DocumentId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."DocumentVersions"
    ADD CONSTRAINT "FK_DocumentVersions_Documents_DocumentId" FOREIGN KEY ("DocumentId") REFERENCES public."Documents"("Id") ON DELETE CASCADE;


--
-- Name: DocumentVersions FK_DocumentVersions_Users_CreatorId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."DocumentVersions"
    ADD CONSTRAINT "FK_DocumentVersions_Users_CreatorId" FOREIGN KEY ("CreatorId") REFERENCES public."Users"("Id");


--
-- Name: DocumentVersions FK_DocumentVersions_Users_LastModifierId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."DocumentVersions"
    ADD CONSTRAINT "FK_DocumentVersions_Users_LastModifierId" FOREIGN KEY ("LastModifierId") REFERENCES public."Users"("Id");


--
-- Name: Documents FK_Documents_Projects_ProjectId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."Documents"
    ADD CONSTRAINT "FK_Documents_Projects_ProjectId" FOREIGN KEY ("ProjectId") REFERENCES public."Projects"("Id") ON DELETE CASCADE;


--
-- Name: EscalationMatrices FK_EscalationMatrices_Projects_ProjectId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."EscalationMatrices"
    ADD CONSTRAINT "FK_EscalationMatrices_Projects_ProjectId" FOREIGN KEY ("ProjectId") REFERENCES public."Projects"("Id") ON DELETE CASCADE;


--
-- Name: MeetingMinutes FK_MeetingMinutes_Projects_ProjectId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."MeetingMinutes"
    ADD CONSTRAINT "FK_MeetingMinutes_Projects_ProjectId" FOREIGN KEY ("ProjectId") REFERENCES public."Projects"("Id") ON DELETE CASCADE;


--
-- Name: MeetingMinutes FK_MeetingMinutes_Users_CreatorId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."MeetingMinutes"
    ADD CONSTRAINT "FK_MeetingMinutes_Users_CreatorId" FOREIGN KEY ("CreatorId") REFERENCES public."Users"("Id");


--
-- Name: MeetingMinutes FK_MeetingMinutes_Users_LastModifierId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."MeetingMinutes"
    ADD CONSTRAINT "FK_MeetingMinutes_Users_LastModifierId" FOREIGN KEY ("LastModifierId") REFERENCES public."Users"("Id");


--
-- Name: OpenIddictAuthorizations FK_OpenIddictAuthorizations_OpenIddictApplications_Application~; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."OpenIddictAuthorizations"
    ADD CONSTRAINT "FK_OpenIddictAuthorizations_OpenIddictApplications_Application~" FOREIGN KEY ("ApplicationId") REFERENCES public."OpenIddictApplications"("Id");


--
-- Name: OpenIddictTokens FK_OpenIddictTokens_OpenIddictApplications_ApplicationId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."OpenIddictTokens"
    ADD CONSTRAINT "FK_OpenIddictTokens_OpenIddictApplications_ApplicationId" FOREIGN KEY ("ApplicationId") REFERENCES public."OpenIddictApplications"("Id");


--
-- Name: OpenIddictTokens FK_OpenIddictTokens_OpenIddictAuthorizations_AuthorizationId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."OpenIddictTokens"
    ADD CONSTRAINT "FK_OpenIddictTokens_OpenIddictAuthorizations_AuthorizationId" FOREIGN KEY ("AuthorizationId") REFERENCES public."OpenIddictAuthorizations"("Id");


--
-- Name: PhaseMilestones FK_PhaseMilestones_Projects_ProjectId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."PhaseMilestones"
    ADD CONSTRAINT "FK_PhaseMilestones_Projects_ProjectId" FOREIGN KEY ("ProjectId") REFERENCES public."Projects"("Id") ON DELETE CASCADE;


--
-- Name: PhaseMilestones FK_PhaseMilestones_Users_CreatorId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."PhaseMilestones"
    ADD CONSTRAINT "FK_PhaseMilestones_Users_CreatorId" FOREIGN KEY ("CreatorId") REFERENCES public."Users"("Id");


--
-- Name: PhaseMilestones FK_PhaseMilestones_Users_LastModifierId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."PhaseMilestones"
    ADD CONSTRAINT "FK_PhaseMilestones_Users_LastModifierId" FOREIGN KEY ("LastModifierId") REFERENCES public."Users"("Id");


--
-- Name: ProjectBudgets FK_ProjectBudgets_Projects_ProjectId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."ProjectBudgets"
    ADD CONSTRAINT "FK_ProjectBudgets_Projects_ProjectId" FOREIGN KEY ("ProjectId") REFERENCES public."Projects"("Id") ON DELETE CASCADE;


--
-- Name: ProjectBudgets FK_ProjectBudgets_Users_CreatorId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."ProjectBudgets"
    ADD CONSTRAINT "FK_ProjectBudgets_Users_CreatorId" FOREIGN KEY ("CreatorId") REFERENCES public."Users"("Id");


--
-- Name: ProjectBudgets FK_ProjectBudgets_Users_LastModifierId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."ProjectBudgets"
    ADD CONSTRAINT "FK_ProjectBudgets_Users_LastModifierId" FOREIGN KEY ("LastModifierId") REFERENCES public."Users"("Id");


--
-- Name: ProjectResources FK_ProjectResources_Projects_ProjectId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."ProjectResources"
    ADD CONSTRAINT "FK_ProjectResources_Projects_ProjectId" FOREIGN KEY ("ProjectId") REFERENCES public."Projects"("Id") ON DELETE CASCADE;


--
-- Name: ProjectResources FK_ProjectResources_Users_CreatorId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."ProjectResources"
    ADD CONSTRAINT "FK_ProjectResources_Users_CreatorId" FOREIGN KEY ("CreatorId") REFERENCES public."Users"("Id");


--
-- Name: ProjectResources FK_ProjectResources_Users_LastModifierId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."ProjectResources"
    ADD CONSTRAINT "FK_ProjectResources_Users_LastModifierId" FOREIGN KEY ("LastModifierId") REFERENCES public."Users"("Id");


--
-- Name: RemediationStep FK_RemediationStep_RiskProfiles_RiskProfileId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."RemediationStep"
    ADD CONSTRAINT "FK_RemediationStep_RiskProfiles_RiskProfileId" FOREIGN KEY ("RiskProfileId") REFERENCES public."RiskProfiles"("Id") ON DELETE CASCADE;


--
-- Name: RemediationStep FK_RemediationStep_Users_CreatorId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."RemediationStep"
    ADD CONSTRAINT "FK_RemediationStep_Users_CreatorId" FOREIGN KEY ("CreatorId") REFERENCES public."Users"("Id");


--
-- Name: RemediationStep FK_RemediationStep_Users_LastModifierId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."RemediationStep"
    ADD CONSTRAINT "FK_RemediationStep_Users_LastModifierId" FOREIGN KEY ("LastModifierId") REFERENCES public."Users"("Id");


--
-- Name: RiskProfiles FK_RiskProfiles_Projects_ProjectId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."RiskProfiles"
    ADD CONSTRAINT "FK_RiskProfiles_Projects_ProjectId" FOREIGN KEY ("ProjectId") REFERENCES public."Projects"("Id") ON DELETE CASCADE;


--
-- Name: RiskProfiles FK_RiskProfiles_Users_CreatorId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."RiskProfiles"
    ADD CONSTRAINT "FK_RiskProfiles_Users_CreatorId" FOREIGN KEY ("CreatorId") REFERENCES public."Users"("Id");


--
-- Name: RiskProfiles FK_RiskProfiles_Users_LastModifierId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."RiskProfiles"
    ADD CONSTRAINT "FK_RiskProfiles_Users_LastModifierId" FOREIGN KEY ("LastModifierId") REFERENCES public."Users"("Id");


--
-- Name: Sprints FK_Sprints_PhaseMilestones_PhaseMilestoneId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."Sprints"
    ADD CONSTRAINT "FK_Sprints_PhaseMilestones_PhaseMilestoneId" FOREIGN KEY ("PhaseMilestoneId") REFERENCES public."PhaseMilestones"("Id") ON DELETE CASCADE;


--
-- Name: Sprints FK_Sprints_Users_CreatorId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."Sprints"
    ADD CONSTRAINT "FK_Sprints_Users_CreatorId" FOREIGN KEY ("CreatorId") REFERENCES public."Users"("Id");


--
-- Name: Sprints FK_Sprints_Users_LastModifierId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."Sprints"
    ADD CONSTRAINT "FK_Sprints_Users_LastModifierId" FOREIGN KEY ("LastModifierId") REFERENCES public."Users"("Id");


--
-- Name: Stakeholders FK_Stakeholders_Projects_ProjectId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."Stakeholders"
    ADD CONSTRAINT "FK_Stakeholders_Projects_ProjectId" FOREIGN KEY ("ProjectId") REFERENCES public."Projects"("Id") ON DELETE CASCADE;


--
-- Name: Users FK_Users_Organizations_TenantId; Type: FK CONSTRAINT; Schema: public; Owner: jainil
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "FK_Users_Organizations_TenantId" FOREIGN KEY ("TenantId") REFERENCES public."Organizations"("Id");


--
-- jainilQL database dump complete
--

