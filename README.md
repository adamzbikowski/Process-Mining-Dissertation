# Repairing Missing Activity Labels and Timestamps in an Incomplete Log of Clinical Events: Augmenting Process Mining Methods Using LSTM Neural Networks

This repository contains 2 python notebooks. To run the code in the notebooks, the user must first gain access to the MIMIC-III clinical database, and link their Google Cloud account to their Physionet account. For detailed instructions, please refer to: https://mimic.mit.edu/docs/gettingstarted/ and https://mimic.mit.edu/docs/gettingstarted/cloud/bigquery/.

The "activity_pipeline" notebook shows the process of predicting missing activity labels using LSTM neural networks.

The "timestamp_pipeline" notebook shows the process of predicting timestamp values using conformance checking techniques and LSTM neural networks.

The SQL_queries folder, contains SQL query files to be used in the notebooks for event log extraction, 

In the future, a PDF containing the project's findings will be uploaded.
