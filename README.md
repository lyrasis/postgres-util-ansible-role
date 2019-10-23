Ansible Role: PostgreSQL Utilities
=========

WIP: Queries, scripts, & other tools to assist in managing PostgreSQL databases

Requirements
------------

PostgreSQL - currently tested against v9.5.x

Role Variables
--------------

    postgres_util_system_user:        "{{ postgres_admin_user | db_admin_user | default('postgres') }}"
    # postgres_util_system_user_uid: will use if provided. omitted by default
    postgres_util_system_group:       "{{ postgres_util_system_user }}"
    # postgres_util_system_group_gid: will use if provided. omitted by default
    postgres_util_create_system_user: false
    postgres_util_db_name:            "*"
    postgres_util_db_user:            "{{ postgres_util_system_user }}"
    postgres_util_db_password:        ""
    postgres_util_query_files:
    - "db_autovacuum_running.sql"
    - "db_sizes.sql"
    - "table_sizes.sql"
    - "table_vacuum_eligible.sql"

Dependencies
------------

None

Example Playbook
----------------
NOTE: this role must be run with `become: true`

    - hosts: db-client

      tasks:
      - name: Install postgres utilities
       include_role:
         name: postgres-util
       vars:
         postgres_util_system_user:        "postgres"
         postgres_util_db_password:        "{{ vault_db_password }}"
         postgres_util_create_system_user: true
       become: true

License
-------

CC0
