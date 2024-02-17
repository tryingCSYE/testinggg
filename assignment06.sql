{
    "metadata": {
        "kernelspec": {
            "name": "SQL",
            "display_name": "SQL",
            "language": "sql"
        },
        "language_info": {
            "name": "sql",
            "version": ""
        }
    },
    "nbformat_minor": 2,
    "nbformat": 4,
    "cells": [
        {
            "cell_type": "code",
            "source": [
                "\n",
                "\n",
                "\n",
                ""
            ],
            "metadata": {
                "azdata_cell_guid": "0373da75-e77e-450c-9fa8-b9ae5a90a58f",
                "language": "sql"
            },
            "outputs": [
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "Commands completed successfully."
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "Total execution time: 00:00:00"
                    },
                    "metadata": {}
                }
            ],
            "execution_count": 3
        },
        {
            "cell_type": "code",
            "source": [
                "create database LMS;\n",
                "\n",
                "GO\n",
                "\n",
                "USE LMS;\n",
                "\n",
                "GO\n",
                "\n",
                "CREATE TABLE Items (\n",
                "    ItemID INT IDENTITY(1,1) PRIMARY KEY,\n",
                "    Title NVARCHAR(255) NOT NULL,\n",
                "    PublicationYear INT NOT NULL,\n",
                "    ItemType NVARCHAR(50) NOT NULL  \n",
                ");\n",
                "\n",
                "GO \n",
                "\n",
                "CREATE TABLE Books (\n",
                "    ItemID INT PRIMARY KEY,\n",
                "    Author NVARCHAR(255) NOT NULL,\n",
                "    ISBN NVARCHAR(13) NOT NULL,\n",
                "    FOREIGN KEY (ItemID) REFERENCES Items(ItemID)\n",
                ");\n",
                "\n",
                "CREATE TABLE Magazines (\n",
                "    ItemID INT PRIMARY KEY,\n",
                "    IssueNumber INT NOT NULL,\n",
                "    Editor NVARCHAR(255) NOT NULL,\n",
                "    FOREIGN KEY (ItemID) REFERENCES Items(ItemID)\n",
                ");\n",
                "\n",
                "CREATE TABLE DVDs (\n",
                "    ItemID INT PRIMARY KEY,\n",
                "    Duration INT NOT NULL,\n",
                "    Director NVARCHAR(255) NOT NULL,\n",
                "    FOREIGN KEY (ItemID) REFERENCES Items(ItemID)\n",
                ");\n",
                "\n",
                "CREATE TABLE Members (\n",
                "    MemberID INT IDENTITY(1,1) PRIMARY KEY,\n",
                "    Name NVARCHAR(255) NOT NULL,\n",
                "    Email NVARCHAR(255) NOT NULL UNIQUE,\n",
                "    PhoneNumber NVARCHAR(20) NOT NULL\n",
                ");\n",
                "\n",
                "CREATE TABLE Borrowings (\n",
                "    BorrowingID INT IDENTITY(1,1) PRIMARY KEY,\n",
                "    MemberID INT NOT NULL,\n",
                "    ItemID INT NOT NULL,\n",
                "    BorrowDate DATE NOT NULL,\n",
                "    ReturnDate DATE,\n",
                "    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),\n",
                "    FOREIGN KEY (ItemID) REFERENCES Items(ItemID)\n",
                ");\n",
                "\n",
                "\n",
                ""
            ],
            "metadata": {
                "azdata_cell_guid": "a78e9082-f468-4d17-928e-011dd21a8c5f",
                "language": "sql"
            },
            "outputs": [
                {
                    "output_type": "error",
                    "evalue": "Msg 1801, Level 16, State 3, Line 1\nDatabase 'LMS' already exists. Choose a different database name.",
                    "ename": "",
                    "traceback": []
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "Commands completed successfully."
                    },
                    "metadata": {}
                },
                {
                    "output_type": "error",
                    "evalue": "Msg 2714, Level 16, State 6, Line 9\nThere is already an object named 'Items' in the database.",
                    "ename": "",
                    "traceback": []
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "Commands completed successfully."
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "Total execution time: 00:00:00.082"
                    },
                    "metadata": {}
                }
            ],
            "execution_count": 4
        },
        {
            "cell_type": "code",
            "source": [
                "\n",
                ""
            ],
            "metadata": {
                "azdata_cell_guid": "49f41fb1-c710-4380-8ada-106447a2fe9b",
                "language": "sql"
            },
            "outputs": [],
            "execution_count": null
        }
    ]
}