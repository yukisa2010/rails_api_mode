Organization.create!([
    { name: "A株式会社" },
    { name: "B商事(株)" },
    { name: "株式会社C" },
    { name: "株式会社D" }
])

Customer.create!([
    { name: "鈴木太郎", gender: 0, birthday: "1990/02/18", organization_id: 1 },
    { name: "田中次郎", gender: 0, birthday: "1996/12/08", organization_id: 1 },
    { name: "町田真美", gender: 1, birthday: "1993/05/11", organization_id: 1 },
    { name: "大田三郎", gender: 0, birthday: "1991/08/13", organization_id: 1 },
    { name: "松井花子", gender: 1, birthday: "1988/12/18", organization_id: 2 },
    { name: "村田四郎", gender: 0, birthday: "1998/07/12", organization_id: 2 },
    { name: "清田加奈子", gender: 1, birthday: "1997/06/19", organization_id: 2 },
    { name: "松井京子", gender: 1, birthday: "1992/06/19", organization_id: 3 },
    { name: "斎藤久美子", gender: 1, birthday: "1992/09/01", organization_id: 3 },
    { name: "松本五郎", gender: 0, birthday: "1987/01/27", organization_id: 3 }
])


