# Ecommerce_Funnel_Analysis
Beginner SQL project analyzing an e-commerce funnel from site visit to purchase. Built relational tables, inserted sample data, and wrote queries to calculate conversion rates, cart abandonment, device and channel performance, and revenue metrics to identify drop-offs and business optimization opportunities.
# 🛒 E-Commerce Funnel Analysis - Beginner SQL Project

## 🎯 What is This Project?

This project analyzes how customers behave when shopping online. We track their journey from:
1. **Visiting the website** 👉
2. **Looking at products** 👉
3. **Adding items to cart** 👉
4. **Starting checkout** 👉
5. **Completing purchase** ✅

Think of it like a funnel - lots of people start at the top, but only some make it to the bottom!

## 🤔 Why Should You Care?

Understanding where customers drop off helps businesses:
- 💰 Make more money by fixing problems
- 📱 Improve the website experience
- 🎯 Focus marketing on what works
- 📊 Make decisions based on data, not guesses

## 📚 What You'll Learn

By completing this project, you'll learn:
- ✅ How to create databases and tables
- ✅ How to insert data into tables
- ✅ How to write SQL queries to analyze data
- ✅ How to calculate conversion rates
- ✅ How to identify business problems using data
- ✅ How to present data analysis results


## 🗂️ Project Structure

```
ecommerce-funnel-analysis/
│
├── ecommerce_funnel.sql          # Main SQL file with all code
├── README.md                      # This file
└── sample_results/                # Screenshots of query results (optional)
```

## 📊 What's Inside?

### The Database Schema (Tables We Created)

We have 6 tables that work together:

```
👤 USERS                      📅 SESSIONS
├── user_id                   ├── session_id
├── signup_date               ├── user_id
├── country                   ├── visit_date
├── device_type               └── first_page
└── channel                   
                              👁️ PRODUCT_VIEWS
🛒 CART_ADDS                  ├── view_id
├── cart_id                   ├── session_id
├── session_id                ├── product_id
├── product_id                ├── category
└── added_time                └── price

💳 CHECKOUTS                  ✅ ORDERS
├── checkout_id               ├── order_id
├── session_id                ├── session_id
└── checkout_time             ├── total_amount
                              └── status
```

### Sample Data Included
- **20 users** from different countries
- **20 website visits** (sessions)
- **15 product views** (not everyone views products)
- **10 cart additions** (some people just browse)
- **7 checkouts** (some abandon their cart)
- **5 completed orders** (our final conversions!)

## 🔍 Key Analyses You'll Perform

### Query 1: The Basic Funnel
**What it shows:** How many people at each step
```
Step 1: 20 visits → 100%
Step 2: 15 views → 75%
Step 3: 10 carts → 50%
Step 4: 7 checkouts → 35%
Step 5: 5 purchases → 25%
```
**Insight:** We lose the most people between cart and checkout!

### Query 2: Device Performance
**What it shows:** Do Mobile, Desktop, or Tablet users buy more?

**Why it matters:** If mobile has low conversion, maybe the mobile site needs improvement!

### Query 3: Marketing Channel Analysis
**What it shows:** Which marketing channel (Google, Facebook, Email, etc.) brings buyers?

**Why it matters:** Spend more money on channels that work!

### Query 4: Cart Abandonment
**What it shows:** How many people add to cart but don't buy?

**Why it matters:** Each abandoned cart is lost money. Finding why can increase revenue!

### Query 5: Product Category Performance
**What it shows:** Which product types sell best?

**Why it matters:** Stock more of what sells!

### Query 6: Landing Page Optimization
**What it shows:** Which first page leads to most sales?

**Why it matters:** Improve the pages that work!

### Query 7: Revenue Metrics
**What it shows:** Total sales, average order value, revenue per visit

**Why it matters:** Track overall business health!

### Query 8: Daily Trends
**What it shows:** Sales by day

**Why it matters:** Identify peak days for promotions!

### Query 9: Time to Purchase
**What it shows:** How long from browsing to buying?

**Why it matters:** If it takes too long, simplify the process!

### Query 10: Success Summary
**What it shows:** Overall conversion rate

**Why it matters:** Your main KPI (Key Performance Indicator)!

## 💡 Real Insights from This Data

Based on our sample data, here's what we found:

### 🔴 Problems Identified
1. **50% Cart Abandonment** - Half the people who add items don't buy
2. **Only 25% Overall Conversion** - Only 1 in 4 visitors become customers
3. **Checkout Drop-off** - 2 people abandon at checkout stage

### 🟢 Opportunities
1. **Desktop performs best** - Focus on desktop experience
2. **Email marketing works** - Send more emails!
3. **Electronics category** - Best seller, stock more

### 💰 Potential Impact
If we reduce cart abandonment from 50% to 30%:
- Current: 5 sales from 20 visits
- Improved: 7 sales from 20 visits
- **40% revenue increase!** 🚀

## 🎓 Learning Path

### If you're brand new to SQL:
1. Read through the comments in the SQL file
2. Run each query one at a time
3. Try to predict what the results will show
4. Compare your prediction to actual results

### If you know basic SQL:
1. Modify the queries to answer your own questions
2. Add more sample data
3. Try creating new queries
4. Experiment with different calculations

### Challenge Yourself:
1. Add more realistic data (100+ users)
2. Create a monthly trend analysis
3. Add customer segments (new vs returning)
4. Calculate customer lifetime value
5. Build a dashboard in Excel/Google Sheets using query results

## 🛠️ Common Issues & Solutions

### Issue 1: "Database already exists"
**Solution:** Drop the database first:
```sql
DROP DATABASE IF EXISTS ecommerce_funnel;
```

### Issue 2: "Table doesn't exist"
**Solution:** Make sure you ran the CREATE TABLE commands first

### Issue 3: Query returns no results
**Solution:** Check if data was inserted. Run:
```sql
SELECT COUNT(*) FROM sessions;
```
Should return 20.

### Issue 4: Syntax error
**Solution:** Make sure you're running queries in order and selected the right database:
```sql
USE ecommerce_funnel;
``


## 🏆 Skills Demonstrated
- ✅ Write SQL queries (SELECT, JOIN, GROUP BY, etc.)
- ✅ Work with databases (CREATE, INSERT, UPDATE)
- ✅ Perform data analysis
- ✅ Calculate business metrics (conversion rates, ROI)
- ✅ Generate insights from data
- ✅ Communicate technical findings
- ✅ Think like a data analyst

## 📜 License

This project is free to use for learning and portfolio purposes. Feel free to modify and share!

## 🙏 Acknowledgments

This project was created to help beginners learn SQL and data analysis through a real-world business problem. Special thanks to the data analytics community for inspiration!
