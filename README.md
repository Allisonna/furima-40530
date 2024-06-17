# README
## usersテーブル
| Column              | Type       | Options                        |
| ------------        | ---------- | ------------------------------ |
| nickname            | string     | null: false                    |
| email               | string     | null: false, unique: true      |
| encrypted_password  | string     | null: false                    |
| last_name           | string     | null: false                    |
| first_name          | string     | null: false                    |
| last_name_kana      | string     | null: false                    |
| first_name_kana     | string     | null: false                    |
| birth_year          | string     | null: false                    |
| birth_month         | string     | null: false                    |
| birth_day           | string     | null: false                    |

## Itemsテーブル
| Column              | Type       | Options                        |
| ------------        | ---------- | ------------------------------ |
| title               | string     | null: false                    |
| content             | text       | null: false                    |
| category            | string     | null: false                    |
| status              | string     | null: false                    |
| shipping_costs      | string     | null: false                    |
| shipping_area       | string     | null: false                    |
| shipping_days       | string     | null: false                    |
| price               | string     | null: false                    |
| user_id             | references | null: false, foreign_key: true |

## Purchasesテーブル
| Column              | Type       | Options                        |
| ------------        | ---------- | ------------------------------ |
| cardnumber          | string     | null: false                    |
| expiration          | string     | null: false                    |
| securitycode        | string     | null: false                    |
| postcode            | string     | null: false                    |
| prefecture          | string     | null: false                    |
| city                | string     | null: false                    |
| address1            | string     | null: false                    |
| address2            | string     |                                | 
| phonenumber         | string     | null: false                    |
| user_id             | references | null: false, foreign_key: true |
| item_id             | references | null: false, foreign_key: true |

## Categoriesテーブル
| Column              | Type       | Options                        |
| ------------        | ---------- | ------------------------------ |
| item_id             | references | foreign_key: true              |
| name                | string     | null: false                    |

## Conditionsテーブル
| Column              | Type       | Options                        |
| ------------        | ---------- | ------------------------------ |
| item_id             | references | foreign_key: true              |
| condition           | string     | null: false                    |