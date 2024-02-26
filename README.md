# 勤怠管理アプリ
[https://analysis-app.onrender.com](https://manage-app-msms.onrender.com/)

## 概要
従業員とその管理者のための、シフト作成・管理・確認ができるアプリです。
### 背景(製品開発のきっかけ、課題等）
今回のアプリケーションは、アルバイト従業員にとっての利便性の向上を目的として作成しました。具体的には、「アルバイト従業員が、管理者から配布されたデジタルのシフト表を見ながら、その他の今後の予定もTodoアプリなどに入力する」という場面を想定しました。
### 課題
①シフト表を見ながらTodoアプリに入力する手間が発生する。また、この手間によって二重に予定を組んでしまったという経験を実際に聞くこともありました。

②通常アルバイトは勤務時間が日ごとで不規則なので、従業員がシフトの時間を忘れて欠勤、もしくは遅刻してしまう可能性がある。

③もし欠勤することになった場合、(職場によるかもしれないが)代理出勤してくれる人を自分で探す必要がある。
### 特長
#### 1. 特長1(実装済み)
タスク作成機能により、各日でその日にやるべきことをメモできる。また、チェックボックスによりタスクの進捗を反映させることができ、各日でタスクの残件数も表示される。フォームの部分はTurbo frameで実装しているため、ページの遷移なしでスムーズにタスクの作成が可能。
#### 2. 特長2(未実装)
全体のシフトに対して任意で時間(例： 出勤1時間前)を設定して、その時間になるとメールでリマインドしてくれる。また、個別のシフトに対してカスタムで時間を設定することもできる。
#### 3. 特長3(未実装)
シフト表から「代理出勤の募集」ボタンを押すと、募集者のランク以上の人に向けて、代理出勤の募集が従業員グループページに投稿される。「代理出勤する」ボタンを押すと、申請が管理者に送信され、管理者に受理されると代理出勤が可能になる。

### 解決出来ること
#### 1. 解決出来ること1
シフト表に直接Todoをメモできるようにすることで、シフト表とTodoアプリを行き来する必要がなくなり、見る手間も入力する手間も減ると考えられます。　また、二重に予定を組んでしまうミスを減少させることもできると考えます。
#### 2. 解決出来ること2
不規則なシフト時間によって起こりうる「シフト時間の忘れ」をメールによるリマインドで少しでも回避することができます。
#### 3. 解決出来ること3
代理出勤のフローを整備することにより、急な欠勤にもより対応しやすくなり、管理者にとっても従業員にとっても好都合になる。
### 今後の展望
未実装の機能を実装すること。
### 注力したこと（こだわり等）
・Hotwireのturbo frameを使うことで、タスク作成をスムーズにできるようにしたこと
・フォームリクエスト後のレンダリング先で、前の情報(従業員や年月)を読み込ませることによって連続でシフトを作成しやすくする等、UXに気を遣ったこと
## 開発技術
### 活用した技術・フレームワーク・ライブラリ・モジュール
Ruby 3.1.4

Rails 7.0.8

Bootstrap 5.1.3

#### デバイス
* PC・タブレット
