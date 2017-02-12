time0 = Time.current.beginning_of_day

user = User.create!(
  name: 'taro',
  full_name: '山田太郎',
  password: 'password'
)

user = User.create!(
  name: 'hanako',
  full_name: '佐藤花子',
  password: 'password'
)

user = User.create!(
  name: 'jiro',
  full_name: '山本次郎',
  password: 'password'
)

user = User.create!(
  name: 'saburo',
  full_name: '田中三郎',
  password: 'password'
)

user = User.create!(
  name: 'junko',
  full_name: '鈴木純子',
  password: 'password'
)

PlanItem.create!(
  name: '読書',
  description: '『走れメロス』を読む',
  user: user,
  starts_at: time0.advance(days: 1, hours: 10),
  ends_at: time0.advance(days: 1, hours: 11)
)

PlanItem.create!(
  name: '買い物',
  description: '洗剤を買う',
  user: user,
  starts_at: time0.advance(hours: 16),
  ends_at: time0.advance(hours: 16, minutes: 30)
)

PlanItem.create!(
  name: '帰省',
  description: "新幹線の指定席を取る。\nお土産を買う。",
  user: user,
  starts_at: time0.beginning_of_year.advance(years: 1, days: -2),
  ends_at: time0.beginning_of_year.advance(years: 1, days: 3)
)

0.upto(30) do |idx|
  PlanItem.create!(
    name: "予定#{idx}" + (idx % 3 == 0 ? "☆" : ""),
    description: "やることを決めましょう",
    user: user,
    starts_at: time0.beginning_of_year.advance(years: 1, days: -2),
    ends_at: time0.beginning_of_year.advance(years: 1, days: 3)
  )
end
