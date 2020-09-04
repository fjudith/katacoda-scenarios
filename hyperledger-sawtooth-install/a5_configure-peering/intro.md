# Configure Peering

This exercise demonstrates how to configure Validator dynamic peering.

The stack includes by 3 hosts `chsa-a5-00`, `chsa-a5-01` and `chsa-a5-02`.

The `validator`, `settings-tp` and `rest-api` services are already installed and running only on `chsa-a5-00`.

The goal is to add `chsa-a5-01` and `chsa-a5-02` to the network with the exact same set of services.

> **Warning**: Counter to previous exercices, TOML configuration files will not be modified. Instead we will use Environment files located in `/etc/default`.