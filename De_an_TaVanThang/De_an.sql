create database DWH
create database De_an

use De_an
-- import dataSet từ file excel

-- select 
select * from dataSet;
select * from dataClean;
select * from dataNull;

use DWH
-- tạo khóa ngoại
alter table Fact
add constraint fk_Fact_Quốc_Gia
foreign key ([Id Nước Sản Xuất]) references Dim_Nước_Sản_Xuất([Id Nước Sản Xuất]);
GO
alter table Fact
add constraint fk_Fact_Công_Ty_Sản_Xuất
foreign key ([Id Công Ty Sản Xuất]) references Dim_Công_Ty_Sản_Xuất([Id Công Ty Sản Xuất]);
GO
alter table Fact
add constraint fk_Fact_Đơn_Vị_Kê_Khai
foreign key ([Id Đơn Vị Kê Khai]) references Dim_Đơn_Vị_Kê_Khai([Id Đơn Vị Kê Khai]);
GO

-- xóa khóa ngoại
alter table Fact
drop constraint fk_Fact_Quốc_Gia
GO
alter table Fact
drop constraint fk_Fact_Công_Ty_Sản_Xuất
GO
alter table Fact
drop constraint fk_Fact_Đơn_Vị_Kê_Khai

-- xóa bảng các bảng dimension
delete from Dim_Công_Ty_Sản_Xuất;
delete from Dim_Đơn_Vị_Kê_Khai;
delete from Dim_Nước_Sản_Xuất;

-- xóa bảng fact
delete from Fact;

-- select
select * from Dim_Công_Ty_Sản_Xuất;
select * from Dim_Đơn_Vị_Kê_Khai;
select * from Dim_Nước_Sản_Xuất;
select * from Fact;