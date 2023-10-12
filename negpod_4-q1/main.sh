#!/usr/bin/env bash
# this script shows an application that helps students to record 

while true; do

    echo "--------------------------------------"
    echo "Welcome to ALU BSE Registration System"
    echo "--------------------------------------"
    echo "1. Create Student Record"
    echo "2. View All Students"
    echo "3. Delete Student Record"
    echo "4. Update Student Record"
    echo "5. Exit"
    read -p "Enter your choice (1-5): " choice

    case $choice in
        1)
            read -p "Enter student email: " email
            read -p "Enter student age: " age
            read -p "Enter student ID: " id
            echo "$email,$age,$id" >> students-list_0923.txt
            echo "Student record added successfully!"
            ;;
        2)
            echo "-------------------------------------"
            echo "List of Students"
            echo "-------------------------------------"
            cat students-list_0923.txt
            ;;
        3)
            read -p "Enter student ID to delete: " delete_id
            sed -i "/^.*,$delete_id$/d" students-list_0923.txt
            echo "Student record with ID $delete_id deleted successfully!"
            ;;
        4)
            read -p "Enter student ID to update: " update_id
            read -p "Enter updated email: " updated_email
            read -p "Enter updated age: " updated_age
            sed -i "s/^.*,$update_id$/$updated_email,$updated_age,$update_id/" students-list_0923.txt
            echo "Student record with ID $update_id updated successfully!"
            ;;
        5)
            exit 0
            ;;
        *)
            echo "Invalid input. Please try again."
            ;;
    esac
done
