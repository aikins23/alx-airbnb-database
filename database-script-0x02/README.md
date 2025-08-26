# Task 3: Seed Database with Sample Data

## **Description**
This script inserts realistic sample data into the **ALX Airbnb Database**.  
It covers users, properties, bookings, payments, reviews, and messages.

## **How to Run**

### **For PostgreSQL**
```bash
psql -U postgres -d airbnb_db -f seed.sql
