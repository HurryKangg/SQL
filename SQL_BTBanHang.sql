/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     19/11/2026 8:44:39 CH                        */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIEPHIEUDAT') and o.name = 'FK_CHITIEPH_MH_CTPD_MATHANG')
alter table CHITIEPHIEUDAT
   drop constraint FK_CHITIEPH_MH_CTPD_MATHANG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIEPHIEUDAT') and o.name = 'FK_CHITIEPH_PDH_CTPD_PHIEUDAT')
alter table CHITIEPHIEUDAT
   drop constraint FK_CHITIEPH_PDH_CTPD_PHIEUDAT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETHOADON') and o.name = 'FK_CHITIETH_HD_CTHD_HOADON')
alter table CHITIETHOADON
   drop constraint FK_CHITIETH_HD_CTHD_HOADON
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETHOADON') and o.name = 'FK_CHITIETH_MH_CTHD_MATHANG')
alter table CHITIETHOADON
   drop constraint FK_CHITIETH_MH_CTHD_MATHANG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETPHIEUGIAO') and o.name = 'FK_CHITIETP_MH_CTPG_MATHANG')
alter table CHITIETPHIEUGIAO
   drop constraint FK_CHITIETP_MH_CTPG_MATHANG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETPHIEUGIAO') and o.name = 'FK_CHITIETP_PGH_CTPG_PHIEUGIA')
alter table CHITIETPHIEUGIAO
   drop constraint FK_CHITIETP_PGH_CTPG_PHIEUGIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('HOADON') and o.name = 'FK_HOADON_KH_HD_KHACHHAN')
alter table HOADON
   drop constraint FK_HOADON_KH_HD_KHACHHAN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MATHANG') and o.name = 'FK_MATHANG_LH_MH_LOAIHANG')
alter table MATHANG
   drop constraint FK_MATHANG_LH_MH_LOAIHANG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NCC_MH') and o.name = 'FK_NCC_MH_NCC_MH_NHACUNGC')
alter table NCC_MH
   drop constraint FK_NCC_MH_NCC_MH_NHACUNGC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NCC_MH') and o.name = 'FK_NCC_MH_NCC_MH2_MATHANG')
alter table NCC_MH
   drop constraint FK_NCC_MH_NCC_MH2_MATHANG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEUDATHANG') and o.name = 'FK_PHIEUDAT_NCC_PDH_NHACUNGC')
alter table PHIEUDATHANG
   drop constraint FK_PHIEUDAT_NCC_PDH_NHACUNGC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEUGIAOHANG') and o.name = 'FK_PHIEUGIA_PDH_PGH_PHIEUDAT')
alter table PHIEUGIAOHANG
   drop constraint FK_PHIEUGIA_PDH_PGH_PHIEUDAT
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIEPHIEUDAT')
            and   name  = 'MH_CTPD_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIEPHIEUDAT.MH_CTPD_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIEPHIEUDAT')
            and   name  = 'PDH_CTPD_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIEPHIEUDAT.PDH_CTPD_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHITIEPHIEUDAT')
            and   type = 'U')
   drop table CHITIEPHIEUDAT
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIETHOADON')
            and   name  = 'HD_CTHD_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIETHOADON.HD_CTHD_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIETHOADON')
            and   name  = 'MH_CTHD_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIETHOADON.MH_CTHD_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHITIETHOADON')
            and   type = 'U')
   drop table CHITIETHOADON
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIETPHIEUGIAO')
            and   name  = 'PGH_CTPG_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIETPHIEUGIAO.PGH_CTPG_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIETPHIEUGIAO')
            and   name  = 'MH_CTPG_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIETPHIEUGIAO.MH_CTPG_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHITIETPHIEUGIAO')
            and   type = 'U')
   drop table CHITIETPHIEUGIAO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HOADON')
            and   name  = 'KH_HD_FK'
            and   indid > 0
            and   indid < 255)
   drop index HOADON.KH_HD_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HOADON')
            and   type = 'U')
   drop table HOADON
go

if exists (select 1
            from  sysobjects
           where  id = object_id('KHACHHANG')
            and   type = 'U')
   drop table KHACHHANG
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LOAIHANG')
            and   type = 'U')
   drop table LOAIHANG
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MATHANG')
            and   name  = 'LH_MH_FK'
            and   indid > 0
            and   indid < 255)
   drop index MATHANG.LH_MH_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MATHANG')
            and   type = 'U')
   drop table MATHANG
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NCC_MH')
            and   name  = 'NCC_MH2_FK'
            and   indid > 0
            and   indid < 255)
   drop index NCC_MH.NCC_MH2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NCC_MH')
            and   name  = 'NCC_MH_FK'
            and   indid > 0
            and   indid < 255)
   drop index NCC_MH.NCC_MH_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NCC_MH')
            and   type = 'U')
   drop table NCC_MH
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NHACUNGCAP')
            and   type = 'U')
   drop table NHACUNGCAP
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIEUDATHANG')
            and   name  = 'NCC_PDH_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIEUDATHANG.NCC_PDH_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHIEUDATHANG')
            and   type = 'U')
   drop table PHIEUDATHANG
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIEUGIAOHANG')
            and   name  = 'PDH_PGH_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIEUGIAOHANG.PDH_PGH_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHIEUGIAOHANG')
            and   type = 'U')
   drop table PHIEUGIAOHANG
go

/*==============================================================*/
/* Table: CHITIEPHIEUDAT                                        */
/*==============================================================*/
create table CHITIEPHIEUDAT (
   SODONDATHANG         int                  not null,
   MAMH                 char(10)             not null,
   SOLUONGDAT           int                  null,
   DONDAT               float                null,
   constraint PK_CHITIEPHIEUDAT primary key (SODONDATHANG, MAMH)
)
go

/*==============================================================*/
/* Index: PDH_CTPD_FK                                           */
/*==============================================================*/




create nonclustered index PDH_CTPD_FK on CHITIEPHIEUDAT (SODONDATHANG ASC)
go

/*==============================================================*/
/* Index: MH_CTPD_FK                                            */
/*==============================================================*/




create nonclustered index MH_CTPD_FK on CHITIEPHIEUDAT (MAMH ASC)
go

/*==============================================================*/
/* Table: CHITIETHOADON                                         */
/*==============================================================*/
create table CHITIETHOADON (
   MAMH                 char(10)             not null,
   MAHD                 char(10)             not null,
   SOLUONGMUA           int                  null,
   DONGIA               float                null,
   constraint PK_CHITIETHOADON primary key (MAMH, MAHD)
)
go

/*==============================================================*/
/* Index: MH_CTHD_FK                                            */
/*==============================================================*/




create nonclustered index MH_CTHD_FK on CHITIETHOADON (MAMH ASC)
go

/*==============================================================*/
/* Index: HD_CTHD_FK                                            */
/*==============================================================*/




create nonclustered index HD_CTHD_FK on CHITIETHOADON (MAHD ASC)
go

/*==============================================================*/
/* Table: CHITIETPHIEUGIAO                                      */
/*==============================================================*/
create table CHITIETPHIEUGIAO (
   MAMH                 char(10)             not null,
   SOPHIEU              int                  not null,
   SOLUONGGIAO          int                  null,
   DONGIAO              float                null,
   constraint PK_CHITIETPHIEUGIAO primary key (MAMH, SOPHIEU)
)
go

/*==============================================================*/
/* Index: MH_CTPG_FK                                            */
/*==============================================================*/




create nonclustered index MH_CTPG_FK on CHITIETPHIEUGIAO (MAMH ASC)
go

/*==============================================================*/
/* Index: PGH_CTPG_FK                                           */
/*==============================================================*/




create nonclustered index PGH_CTPG_FK on CHITIETPHIEUGIAO (SOPHIEU ASC)
go

/*==============================================================*/
/* Table: HOADON                                                */
/*==============================================================*/
create table HOADON (
   MAHD                 char(10)             not null,
   MAKH                 char(10)             not null,
   TENHD                varchar(50)          null,
   SOHOADON             int                  null,
   NGAYLAPHOADON        datetime             null,
   TONGTIEN             float                null,
   constraint PK_HOADON primary key (MAHD)
)
go

/*==============================================================*/
/* Index: KH_HD_FK                                              */
/*==============================================================*/




create nonclustered index KH_HD_FK on HOADON (MAKH ASC)
go

/*==============================================================*/
/* Table: KHACHHANG                                             */
/*==============================================================*/
create table KHACHHANG (
   MAKH                 char(10)             not null,
   TENKH                varchar(50)          null,
   DIACHI               varchar(50)          null,
   DIENTHOAI            char(10)             null,
   constraint PK_KHACHHANG primary key (MAKH)
)
go

/*==============================================================*/
/* Table: LOAIHANG                                              */
/*==============================================================*/
create table LOAIHANG (
   MALOAI               char(10)             not null,
   TENLOAI              varchar(50)          null,
   constraint PK_LOAIHANG primary key (MALOAI)
)
go

/*==============================================================*/
/* Table: MATHANG                                               */
/*==============================================================*/
create table MATHANG (
   MAMH                 char(10)             not null,
   MALOAI               char(10)             null,
   TENMH                varchar(50)          null,
   DONVITINH            float                null,
   QUYCACH              varchar(50)          null,
   SOLUONGTON           int                  null,
   constraint PK_MATHANG primary key (MAMH)
)
go

/*==============================================================*/
/* Index: LH_MH_FK                                              */
/*==============================================================*/




create nonclustered index LH_MH_FK on MATHANG (MALOAI ASC)
go

/*==============================================================*/
/* Table: NCC_MH                                                */
/*==============================================================*/
create table NCC_MH (
   MACC                 char(10)             not null,
   MAMH                 char(10)             not null,
   constraint PK_NCC_MH primary key (MACC, MAMH)
)
go

/*==============================================================*/
/* Index: NCC_MH_FK                                             */
/*==============================================================*/




create nonclustered index NCC_MH_FK on NCC_MH (MACC ASC)
go

/*==============================================================*/
/* Index: NCC_MH2_FK                                            */
/*==============================================================*/




create nonclustered index NCC_MH2_FK on NCC_MH (MAMH ASC)
go

/*==============================================================*/
/* Table: NHACUNGCAP                                            */
/*==============================================================*/
create table NHACUNGCAP (
   MACC                 char(10)             not null,
   TENCC                varchar(50)          null,
   DIACHI               varchar(50)          null,
   DIENTHOAI            char(10)             null,
   constraint PK_NHACUNGCAP primary key (MACC)
)
go

/*==============================================================*/
/* Table: PHIEUDATHANG                                          */
/*==============================================================*/
create table PHIEUDATHANG (
   SODONDATHANG         int                  not null,
   MACC                 char(10)             null,
   NGAYDAT              datetime             null,
   TONGSOMH             float                null,
   constraint PK_PHIEUDATHANG primary key (SODONDATHANG)
)
go

/*==============================================================*/
/* Index: NCC_PDH_FK                                            */
/*==============================================================*/




create nonclustered index NCC_PDH_FK on PHIEUDATHANG (MACC ASC)
go

/*==============================================================*/
/* Table: PHIEUGIAOHANG                                         */
/*==============================================================*/
create table PHIEUGIAOHANG (
   SOPHIEU              int                  not null,
   SODONDATHANG         int                  null,
   NGAYGIAO             datetime             null,
   constraint PK_PHIEUGIAOHANG primary key (SOPHIEU)
)
go

/*==============================================================*/
/* Index: PDH_PGH_FK                                            */
/*==============================================================*/




create nonclustered index PDH_PGH_FK on PHIEUGIAOHANG (SODONDATHANG ASC)
go

alter table CHITIEPHIEUDAT
   add constraint FK_CHITIEPH_MH_CTPD_MATHANG foreign key (MAMH)
      references MATHANG (MAMH)
go

alter table CHITIEPHIEUDAT
   add constraint FK_CHITIEPH_PDH_CTPD_PHIEUDAT foreign key (SODONDATHANG)
      references PHIEUDATHANG (SODONDATHANG)
go

alter table CHITIETHOADON
   add constraint FK_CHITIETH_HD_CTHD_HOADON foreign key (MAHD)
      references HOADON (MAHD)
go

alter table CHITIETHOADON
   add constraint FK_CHITIETH_MH_CTHD_MATHANG foreign key (MAMH)
      references MATHANG (MAMH)
go

alter table CHITIETPHIEUGIAO
   add constraint FK_CHITIETP_MH_CTPG_MATHANG foreign key (MAMH)
      references MATHANG (MAMH)
go

alter table CHITIETPHIEUGIAO
   add constraint FK_CHITIETP_PGH_CTPG_PHIEUGIA foreign key (SOPHIEU)
      references PHIEUGIAOHANG (SOPHIEU)
go

alter table HOADON
   add constraint FK_HOADON_KH_HD_KHACHHAN foreign key (MAKH)
      references KHACHHANG (MAKH)
go

alter table MATHANG
   add constraint FK_MATHANG_LH_MH_LOAIHANG foreign key (MALOAI)
      references LOAIHANG (MALOAI)
go

alter table NCC_MH
   add constraint FK_NCC_MH_NCC_MH_NHACUNGC foreign key (MACC)
      references NHACUNGCAP (MACC)
go

alter table NCC_MH
   add constraint FK_NCC_MH_NCC_MH2_MATHANG foreign key (MAMH)
      references MATHANG (MAMH)
go

alter table PHIEUDATHANG
   add constraint FK_PHIEUDAT_NCC_PDH_NHACUNGC foreign key (MACC)
      references NHACUNGCAP (MACC)
go

alter table PHIEUGIAOHANG
   add constraint FK_PHIEUGIA_PDH_PGH_PHIEUDAT foreign key (SODONDATHANG)
      references PHIEUDATHANG (SODONDATHANG)
go

