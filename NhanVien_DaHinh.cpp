#include<iostream>
#include<cmath>
#include<stdio.h>
using namespace std;
class nhanvien
{
	private:
		string manv,hoten,ngaysinh,diachi;
	public:
		nhanvien() {
			manv="";
			hoten="";
			ngaysinh="";
			diachi="";
		}
		virtual void Nhap(){
			fflush(stdin);
			cout<<"Ma nhan vien: "; getline(cin,manv);
			cout<<"Ho ten: "; getline(cin,hoten);
			cout<<"Ngay sinh: "; getline(cin,ngaysinh);
			cout<<"Dia chi: "; getline(cin,diachi);
		}
		virtual void Xuat() {
			cout<<"Ma nhan vien: "<<manv<<"\n";
			cout<<"Ho ten: "<<hoten<<"\n";
			cout<<"Ngay sinh: "<<ngaysinh<<"\n";
			cout<<"Dia chi: "<<diachi<<"\n";
		}
		virtual int luong()=0;
		~nhanvien() {
		}
};
class sanxuat: public nhanvien
{
	private:
		int sosp;
	public:
		sanxuat() {
			sosp=0;
		}
		void Nhap() {
			nhanvien::Nhap();
			cout<<"So san pham: "; cin>>sosp;
		}
		void Xuat() {
			nhanvien::Xuat();
			cout<<"So san pham: "<<sosp<<"\n";
			cout<<"Luong: "<<luong()<<"\n";
		}
		int luong() {
			return sosp*20000;
		}
		~sanxuat() {
		}
};
class congnhat: public nhanvien {
	private:
		int songay;
	public:
		congnhat() {
			songay=0;
		}
		void Nhap() {
			nhanvien::Nhap();
			cout<<"So ngay: "; cin>>songay;
		}
		void Xuat() {
			nhanvien::Xuat();
			cout<<"So ngay: "<<songay<<"\n";
			cout<<"Luong: "<<luong()<<"\n";
		}
		int luong() {
			return songay*55000;
		}
		~congnhat() {
		}
};
class quanly: public nhanvien{
	private:
		float hesoluong;
		int luongcoban;
	public:
		quanly() {
			hesoluong=0;
			luongcoban=0;
		}
		void Nhap() {
			nhanvien::Nhap();
			cout<<"He so luong: "; cin>>hesoluong;
			cout<<"Luong co ban: "; cin>>luongcoban;
		}
		void Xuat() {
			nhanvien::Xuat();
			cout<<"He so luong: "<<hesoluong<<"\n";
			cout<<"Luong co ban: "<<luongcoban<<"\n";
			cout<<"Luong: "<<luong()<<"\n";
		}
		int luong() {
			return hesoluong*luongcoban;
		}
		~quanly() {
		}
};
class CCongTy{
	private:
		int n;
		nhanvien *a[10000];
	public:
		CCongTy() {
			n=0;
		}
		void Nhap() {
			int i,k;
			cout<<"Nhap so nhan vien cong ty: "; cin>>n;
			for (i=0; i< n; i++) {
                cout<<"Nhap nhan vien 1-sanxuat, 2-congnhat, 3-quanly: "; cin>>k;
                if (k==1) a[i]= new sanxuat(); else
                    if (k==2) a[i]= new congnhat(); else
                        a[i]=new quanly();
                a[i]->Nhap();
			}
		}
		void Xuat() {
			int i;
			cout<<"Danh sach nhan vien cong ty: \n";
			for (i=0; i<n; i++) a[i]->Xuat();
		}
		int tongluong() {
			int sum=0,i;
			for (i=0; i<n; i++) sum+=a[i]->luong();
			return sum;
		}
		void maxsalary() {
			int max=0,i;
			cout<<"Nhan vien co luong cao nhat: \n ";
			for (i=0; i<n; i++)
                if (a[i]->luong()>a[max]->luong()) max=i;
            a[max]->Xuat();

		}
		~CCongTy() {
			delete a;
		}
};
int main()
{
	CCongTy a;
	a.Nhap();
	a.Xuat();
	cout<<"Tong luong tat ca nhan vien: "<<a.tongluong()<<"\n";
	a.maxsalary();
	return 0;
}

