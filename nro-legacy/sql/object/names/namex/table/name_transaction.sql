-- noinspection SqlNoDataSourceInspectionForFile

DROP TABLE NAMEX.NAME_TRANSACTION CASCADE CONSTRAINTS;

CREATE TABLE NAMEX.NAME_TRANSACTION
(
  TRANSACTION_ID  NUMBER(10)                    NOT NULL,
  STATUS_SOLR     CHAR(1 BYTE)                  DEFAULT 'P'                   NOT NULL,
  STATUS_NAMEX    CHAR(1 BYTE)                  DEFAULT 'P'                   NOT NULL
);


GRANT INSERT ON NAMEX.NAME_TRANSACTION TO NAMESDB;
