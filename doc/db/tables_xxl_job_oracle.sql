-- auto-generated definition
create table XXL_JOB_INFO
(
    ID                        NUMBER(20)                          not null
        primary key,
    JOB_GROUP                 NUMBER(20)                          not null,
    JOB_DESC                  VARCHAR2(510)                       not null,
    ADD_TIME                  DATE           default NULL,
    UPDATE_TIME               DATE           default NULL,
    AUTHOR                    VARCHAR2(64)   default NULL,
    ALARM_EMAIL               VARCHAR2(255)  default NULL,
    SCHEDULE_TYPE             VARCHAR2(50)   default 'NONE'       not null,
    SCHEDULE_CONF             VARCHAR2(128)  default NULL,
    MISFIRE_STRATEGY          VARCHAR2(50)   default 'DO_NOTHING' not null,
    EXECUTOR_ROUTE_STRATEGY   VARCHAR2(50)   default NULL,
    EXECUTOR_HANDLER          VARCHAR2(255)  default NULL,
    EXECUTOR_PARAM            VARCHAR2(1024) default NULL,
    EXECUTOR_BLOCK_STRATEGY   VARCHAR2(100)  default NULL,
    EXECUTOR_TIMEOUT          NUMBER(11)     default 0            not null,
    EXECUTOR_FAIL_RETRY_COUNT NUMBER(11)     default 0            not null,
    GLUE_TYPE                 VARCHAR2(100)                       not null,
    GLUE_SOURCE               CLOB           default NULL,
    GLUE_REMARK               VARCHAR2(256)  default NULL,
    GLUE_UPDATETIME           DATE           default NULL,
    CHILD_JOBID               VARCHAR2(255)  default NULL,
    TRIGGER_STATUS            NUMBER(4)      default 0            not null,
    TRIGGER_LAST_TIME         NUMBER(20)     default 0            not null,
    TRIGGER_NEXT_TIME         NUMBER(20)     default 0            not null
)
/

comment on column XXL_JOB_INFO.JOB_GROUP is '执行器主键ID'
/

comment on column XXL_JOB_INFO.AUTHOR is '作者'
/

comment on column XXL_JOB_INFO.ALARM_EMAIL is '报警邮件'
/

comment on column XXL_JOB_INFO.SCHEDULE_TYPE is '调度类型'
/

comment on column XXL_JOB_INFO.SCHEDULE_CONF is '调度配置，值含义取决于调度类型'
/

comment on column XXL_JOB_INFO.MISFIRE_STRATEGY is '调度过期策略'
/

comment on column XXL_JOB_INFO.EXECUTOR_ROUTE_STRATEGY is '执行器路由策略'
/

comment on column XXL_JOB_INFO.EXECUTOR_HANDLER is '执行器任务handler'
/

comment on column XXL_JOB_INFO.EXECUTOR_PARAM is '执行器任务参数'
/

comment on column XXL_JOB_INFO.EXECUTOR_BLOCK_STRATEGY is '阻塞处理策略'
/

comment on column XXL_JOB_INFO.EXECUTOR_TIMEOUT is '任务执行超时时间，单位秒'
/

comment on column XXL_JOB_INFO.EXECUTOR_FAIL_RETRY_COUNT is '失败重试次数'
/

comment on column XXL_JOB_INFO.GLUE_TYPE is 'GLUE类型'
/

comment on column XXL_JOB_INFO.GLUE_SOURCE is 'GLUE源代码'
/

comment on column XXL_JOB_INFO.GLUE_REMARK is 'GLUE备注'
/

comment on column XXL_JOB_INFO.GLUE_UPDATETIME is 'GLUE更新时间'
/

comment on column XXL_JOB_INFO.CHILD_JOBID is '子任务ID，多个逗号分隔'
/

comment on column XXL_JOB_INFO.TRIGGER_STATUS is '调度状态：0-停止，1-运行'
/

comment on column XXL_JOB_INFO.TRIGGER_LAST_TIME is '上次调度时间'
/

comment on column XXL_JOB_INFO.TRIGGER_NEXT_TIME is '下次调度时间'
/

-------------------------------------------------------------------------------
-- auto-generated definition
create table XXL_JOB_LOG
(
    ID                        NUMBER(20)               not null
        primary key,
    JOB_GROUP                 NUMBER(20)               not null,
    JOB_ID                    NUMBER(20)               not null,
    EXECUTOR_ADDRESS          VARCHAR2(255)  default NULL,
    EXECUTOR_HANDLER          VARCHAR2(255)  default NULL,
    EXECUTOR_PARAM            VARCHAR2(1024) default NULL,
    EXECUTOR_SHARDING_PARAM   VARCHAR2(40)   default NULL,
    EXECUTOR_FAIL_RETRY_COUNT NUMBER(11)     default 0 not null,
    TRIGGER_TIME              DATE           default NULL,
    TRIGGER_CODE              NUMBER(11)               not null,
    TRIGGER_MSG               CLOB           default NULL,
    HANDLE_TIME               DATE           default NULL,
    HANDLE_CODE               NUMBER(11)               not null,
    HANDLE_MSG                CLOB           default NULL,
    ALARM_STATUS              NUMBER(4)      default 0 not null
)
/

comment on column XXL_JOB_LOG.JOB_GROUP is '执行器主键ID'
/

comment on column XXL_JOB_LOG.JOB_ID is '任务，主键ID'
/

comment on column XXL_JOB_LOG.EXECUTOR_ADDRESS is '执行器地址，本次执行的地址'
/

comment on column XXL_JOB_LOG.EXECUTOR_HANDLER is '执行器任务handler'
/

comment on column XXL_JOB_LOG.EXECUTOR_PARAM is '执行器任务参数'
/

comment on column XXL_JOB_LOG.EXECUTOR_SHARDING_PARAM is '执行器任务分片参数，格式如 1/2'
/

comment on column XXL_JOB_LOG.EXECUTOR_FAIL_RETRY_COUNT is '失败重试次数'
/

comment on column XXL_JOB_LOG.TRIGGER_TIME is '调度-时间'
/

comment on column XXL_JOB_LOG.TRIGGER_CODE is '调度-结果'
/

comment on column XXL_JOB_LOG.TRIGGER_MSG is '调度-日志'
/

comment on column XXL_JOB_LOG.HANDLE_TIME is '执行-时间'
/

comment on column XXL_JOB_LOG.HANDLE_CODE is '执行-状态'
/

comment on column XXL_JOB_LOG.HANDLE_MSG is '执行-日志'
/

comment on column XXL_JOB_LOG.ALARM_STATUS is '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败'
/

create index I_TRIGGER_TIME
    on XXL_JOB_LOG (TRIGGER_TIME)
/

create index I_HANDLE_CODE
    on XXL_JOB_LOG (HANDLE_CODE)
/


-----------------------------------------------------------------------------------------------------------
-- auto-generated definition
create table XXL_JOB_LOG_REPORT
(
    ID            NUMBER(20)           not null
        primary key,
    TRIGGER_DAY   DATE       default NULL,
    RUNNING_COUNT NUMBER(20) default 0 not null,
    SUC_COUNT     NUMBER(20) default 0 not null,
    FAIL_COUNT    NUMBER(20) default 0 not null,
    UPDATE_TIME   DATE       default NULL
)
/

comment on column XXL_JOB_LOG_REPORT.ID is 'report主键ID'
/

comment on column XXL_JOB_LOG_REPORT.TRIGGER_DAY is '调度-时间'
/

comment on column XXL_JOB_LOG_REPORT.RUNNING_COUNT is '运行中-日志数量'
/

comment on column XXL_JOB_LOG_REPORT.SUC_COUNT is '执行成功-日志数量'
/

comment on column XXL_JOB_LOG_REPORT.FAIL_COUNT is '执行失败-日志数量'
/

create unique index I_TRIGGER_DAY
    on XXL_JOB_LOG_REPORT (TRIGGER_DAY)
/

-------------------------------------------------------------------------------
-- auto-generated definition
create table XXL_JOB_LOGGLUE
(
    ID          NUMBER(20)                              not null
        primary key,
    JOB_ID      NUMBER(20)                              not null,
    GLUE_TYPE   VARCHAR2(100) default NULL,
    GLUE_SOURCE CLOB          default NULL,
    GLUE_REMARK VARCHAR2(256)                           not null,
    ADD_TIME    DATE          default NULL,
    UPDATE_TIME DATE          default CURRENT_TIMESTAMP not null
)
/

comment on column XXL_JOB_LOGGLUE.JOB_ID is '任务，主键ID'
/

comment on column XXL_JOB_LOGGLUE.GLUE_TYPE is 'GLUE类型'
/

comment on column XXL_JOB_LOGGLUE.GLUE_SOURCE is 'GLUE源代码'
/

comment on column XXL_JOB_LOGGLUE.GLUE_REMARK is 'GLUE备注'
/

--------------------------------------------------------------------------------------------
-- auto-generated definition
create table XXL_JOB_REGISTRY
(
    ID             NUMBER(20)                     not null
        primary key,
    REGISTRY_GROUP VARCHAR2(510)                  not null,
    REGISTRY_KEY   VARCHAR2(510)                  not null,
    REGISTRY_VALUE VARCHAR2(510)                  not null,
    UPDATE_TIME    DATE default CURRENT_TIMESTAMP not null
)
/

create index I_G_K_V
    on XXL_JOB_REGISTRY (REGISTRY_GROUP, REGISTRY_KEY, REGISTRY_VALUE)
/

-------------------------------------------------------------------------------
-- auto-generated definition
create table XXL_JOB_GROUP
(
    ID           NUMBER(20)                              not null
        primary key,
    APP_NAME     VARCHAR2(128)                           not null,
    TITLE        VARCHAR2(64)                            not null,
    ADDRESS_TYPE NUMBER(4)     default 0                 not null,
    ADDRESS_LIST VARCHAR2(512) default NULL,
    UPDATE_TIME  DATE          default CURRENT_TIMESTAMP not null
)
/

comment on column XXL_JOB_GROUP.APP_NAME is '执行器AppName'
/

comment on column XXL_JOB_GROUP.TITLE is '执行器名称'
/

comment on column XXL_JOB_GROUP.ADDRESS_TYPE is '执行器地址类型：0=自动注册、1=手动录入'
/

comment on column XXL_JOB_GROUP.ADDRESS_LIST is '执行器地址列表，多地址逗号分隔'
/

---------------------------------------------------------------------------------------
-- auto-generated definition
create table XXL_JOB_USER
(
    ID         NUMBER(20)   not null
        primary key,
    USERNAME   VARCHAR2(50) not null,
    PASSWORD   VARCHAR2(50) not null,
    ROLE       NUMBER(4)    not null,
    PERMISSION VARCHAR2(510) default NULL
)
/

comment on column XXL_JOB_USER.USERNAME is '账号'
/

comment on column XXL_JOB_USER.PASSWORD is '密码'
/

comment on column XXL_JOB_USER.ROLE is '角色：0-普通用户、1-管理员'
/

comment on column XXL_JOB_USER.PERMISSION is '权限：执行器ID列表，多个逗号分割'
/

create unique index I_USERNAME
    on XXL_JOB_USER (USERNAME)
/

----------------------------------------------------------------------------------
-- auto-generated definition
create table XXL_JOB_LOCK
(
    LOCK_NAME VARCHAR2(50) not null
        primary key
)
/

comment on column XXL_JOB_LOCK.LOCK_NAME is '锁名称'
/

--------------------------------------------------------------------------------------
INSERT INTO XXL_JOB_GROUP(ID, APP_NAME, TITLE, ADDRESS_TYPE, ADDRESS_LIST, UPDATE_TIME) VALUES (1, 'xxl-job-executor-sample', '示例执行器', 0, NULL, '2018-11-03 22:21:31' );
INSERT INTO XXL_JOB_INFO(ID, JOB_GROUP, JOB_DESC, ADD_TIME, UPDATE_TIME, AUTHOR, ALARM_EMAIL, SCHEDULE_TYPE, SCHEDULE_CONF, MISFIRE_STRATEGY, EXECUTOR_ROUTE_STRATEGY, EXECUTOR_HANDLER, EXECUTOR_PARAM, EXECUTOR_BLOCK_STRATEGY, EXECUTOR_TIMEOUT, EXECUTOR_FAIL_RETRY_COUNT, GLUE_TYPE, GLUE_SOURCE, GLUE_REMARK, GLUE_UPDATETIME, CHILD_JOBID) VALUES (1, 1, '测试任务1', '2018-11-03 22:21:31', '2018-11-03 22:21:31', 'XXL', '', 'CRON', '0 0 0 * * ? *', 'DO_NOTHING', 'FIRST', 'demoJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2018-11-03 22:21:31', '');
INSERT INTO XXL_JOB_USER(ID, USERNAME, PASSWORD, ROLE, PERMISSION) VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);
INSERT INTO XXL_JOB_LOCK ( LOCK_NAME) VALUES ( 'schedule_lock');

commit;