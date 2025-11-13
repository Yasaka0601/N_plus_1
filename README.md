# N+1問題について

「N + 1 問題」について説明してください。<br>
って、企業面接で質問されたら私は嫌です。
なので、勉強しました。
まず、結論から申し上げます。
N + 1問題とはデータベースからデータを取得する際、ループ処理の中でSQLを大量に発行してしまい、パフォーマンスが低下してしまう問題のことです。
解決方法は「includes」メソッドを使って、必要なデータをまとめて取得しましょう。
以上になります。
これだけ覚えて帰ってください。

## どんな時に発生するのか
「１対多」のアソシエーションの場合に発生します。
```mermaid
erDiagram
  TRAINERS {
    bigint id PK
    string email
    string encrypted_password
    string reset_password_token
    datetime reset_password_sent_at
    datetime remember_created_at
    datetime created_at
    datetime updated_at
    string name
  }

  POKEMONS {
    bigint id PK
    string name
    bigint trainer_id FK
    datetime created_at
    datetime updated_at
  }

  TRAINERS ||--o{ POKEMONS : "has many"
```