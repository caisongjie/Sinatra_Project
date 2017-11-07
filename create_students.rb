require "./students"

s = Students.new(firstname: "Songjie", lastname: "Cai", birthday: "03/31/1995", address: "500 El Camino Real")
s1 = Students.new(firstname: "FN1", lastname: "LN1", birthday: "03/31/1995", address: "500 El Camino Real")
s2 = Students.new(firstname: "FN2", lastname: "LN2", birthday: "03/31/1995", address: "500 El Camino Real")
s3 = Students.new(firstname: "FN3", lastname: "LN3", birthday: "03/31/1995", address: "500 El Camino Real")
s4 = Students.new(firstname: "FN4", lastname: "LN4", birthday: "03/31/1995", address: "500 El Camino Real")
s5 = Students.new(firstname: "FN5", lastname: "LN5", birthday: "03/31/1995", address: "500 El Camino Real")

s.save
s1.save
s2.save
s3.save
s4.save

