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
| birthday            | date       | null: false                    |

### Association
- has_many :items
- has_many :purchases

## Itemsテーブル
| Column              | Type       | Options                        |
| ------------        | ---------- | ------------------------------ |
| title               | string     | null: false                    |
| content             | text       | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| shipping_cost_id    | integer    | null: false                    |
| shipping_area_id    | integer    | null: false                    |
| shipping_day_id     | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_one :purchase

## Purchasesテーブル
| Column              | Type       | Options                        |
| ------------        | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association
- belongs_to :items
- belongs_to :users
- has_one :address

## Addressesテーブル
| Column              | Type       | Options                        |
| ------------        | ---------- | ------------------------------ |
| postcode            | string     | null: false                    |
| shipping_area_id    | integer    | null: false                    |
| city                | string     | null: false                    |
| address1            | string     | null: false                    |
| address2            | string     |                                |
| tel                 | string     | null: false                    |
| purchase            | references | null: false, foreign_kry: true |

### Association
- belongs_to :purchase