## Data Dictionary

### Fact_Invoice
- InvoiceID: Unique identifier for invoice  
- CustomerID: Links to customer entity across domains  
- InvoiceAmount: Total billed amount  
- DueDate: Contractual payment date  

### Fact_Payment
- PaymentID: Unique payment transaction  
- PaymentDate: Date payment was received  
- PaymentAmount: Amount paid  
- DiscountTaken: Discount applied at payment  

### Dim_Customer
- CustomerID: Master customer identifier  
- CreditAccountID: Links invoices to credit exposure  
- Region: Geographic segmentation  
