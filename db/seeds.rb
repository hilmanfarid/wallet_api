User.create!([
  {
    id: 1,
    username: "user1@wallet.com",
    crypted_password: "8c45dfc1e6a96a9e69d483fb306fe72cf6be9356ddd5c1c21928228b0d4a5059",
    secret: "ZTZhMDk3MjAyNC0wOS0wOCAxODo0NzozNCArMDcwMA==",
    token: "",
    status: 1,
    created_at: "2024-09-08 11:47:34.277056",
    updated_at: "2024-09-08 11:47:34.277056"
  },
  {
    id: 2,
    username: "user2@wallet.com",
    crypted_password: "36fe27bec3eebb35dd479c2ffd649c5ace14afa8cfb3937d626132cf185c8a33",
    secret: "NWFlMGYxMjAyNC0wOS0wOCAxODo0Nzo1OCArMDcwMA====",
    token: "",
    status: 1,
    created_at: "2024-09-08 11:47:34.277056",
    updated_at: "2024-09-08 11:47:34.277056"
  },
  {
    id: 3,
    username: "user3@wallet.com",
    crypted_password: "3c7d88b7a47f39fd4f1c5a5ab63ec0877191cd99758b1c64e1ded5b5d6243036",
    secret: "NjJkYmNiMjAyNC0wOS0wOSAyMToyMjo1MCArMDcwMA====",
    token: "",
    status: 1,
    created_at: "2024-09-08 11:47:34.277056",
    updated_at: "2024-09-08 11:47:34.277056"
  }
])

Account.create!([
 {
   id: 1,
   user_id: 1,
   account_number: "0212677229570542",
   account_name: "Toutatis Vlasta",
   status: 1,
   created_at: "2024-09-08 11:47:34.277056",
   updated_at: "2024-09-08 11:47:34.277056"
 },
 {
   id: 2,
   user_id: 2,
   account_number: "0063515001736587",
   account_name: "Chariovalda Krisna",
   status: 1,
   created_at: "2024-09-08 11:47:34.277056",
   updated_at: "2024-09-08 11:47:34.277056"
 },
 {
   id: 3,
   user_id: 3,
   account_number: "2298263287884918",
   account_name: "Aoi Wigbrand ",
   status: 1,
   created_at: "2024-09-08 11:47:34.277056",
   updated_at: "2024-09-08 11:47:34.277056"
 }
])

Deposit.create!([
{
  id: 1,
  account_id: 1,
  amount: 10000,
  created_at: "2024-09-08 11:47:34.277056",
  updated_at: "2024-09-08 11:47:34.277056"
},
{
  id: 2,
  account_id: 1,
  amount: 20000,
  created_at: "2024-09-08 11:47:34.277056",
  updated_at: "2024-09-08 11:47:34.277056"
},
{
  id: 3,
  account_id: 2,
  amount: 50000,
  created_at: "2024-09-08 11:47:34.277056",
  updated_at: "2024-09-08 11:47:34.277056"
}
])

Withdrawal.create!([
  {
    id: 1,
    account_id: 1,
    amount: 1000,
    created_at: "2024-09-08 11:47:34.277056",
    updated_at: "2024-09-08 11:47:34.277056"
  },
  {
    id: 2,
    account_id: 2,
    amount: 2000,
    created_at: "2024-09-08 11:47:34.277056",
    updated_at: "2024-09-08 11:47:34.277056"
  },
  {
    id: 3,
    account_id: 2,
    amount: 5000,
    created_at: "2024-09-08 11:47:34.277056",
    updated_at: "2024-09-08 11:47:34.277056"
  }
])