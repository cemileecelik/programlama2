#%% kütüphane
import bs4 as bs
import pymysql
import urllib.request
import numpy as np
import sys
from PyQt5.QtWidgets import *
from PyQt5 import QtWidgets
import matplotlib.pyplot as plt

#%%class
class Pencere(QtWidgets.QWidget):
    def __init__(self):
        super().__init__()
        self.init_ui()
    def init_ui(self):
        kaynak = urllib.request.urlopen("https://www.hepsiburada.com/erkek-spor-ayakkabilari-c-60002383").read()
        sayfa = bs.BeautifulSoup(kaynak, 'lxml')
        fiyatlardizi = []
        baslıklardizi = []
        fiyatlar = sayfa.find_all("span", {"class": "price product-price"})
        basliklar = sayfa.find_all("p", {"class": "hb-pl-cn"})
        for fiyat in fiyatlar:
            fiyat = fiyat.text
            fiyat = fiyat.replace('TL', '')
            fiyat = fiyat.replace(',', '.')
            fiyat = ''.join(fiyat.split())
            fiyatlardizi.append(fiyat)
        for baslik in basliklar:
            baslik = baslik.text
            baslıklardizi.append(baslik)
        conn = pymysql.connect(host="localhost", user="root", passwd="12345678", db="ayakkabi")
        cursor = conn.cursor(pymysql.cursors.DictCursor)
#%%temizle
        def temizle():
            cursor.execute(
                ''' DELETE FROM ayakkabi''')
            conn.commit()
        temizle()
#%%guncelle
        def guncelle():
            for (isim, fiyat) in zip(baslıklardizi, fiyatlardizi):
                cursor.execute(
                    '''INSERT INTO ayakkabi (ayakkabi_isim,ayakkabi_fiyat)
                       VALUES (%s, %s)''',
                    (isim, fiyat))
                conn.commit()
        guncelle()
        grid = QGridLayout()
        treewidget = QTreeWidget()
        treewidget.setColumnCount(2)
        treewidget.setHeaderLabels(["Ayakkabı", "Fiyatı"])
        vericekme = "SELECT * FROM `ayakkabi`"
        cursor.execute(vericekme)
        veri = cursor.fetchall()
#%% treewidgete veriekleme
        for row in veri:
            l1 = QTreeWidgetItem([row['ayakkabi_isim'], (str(row['ayakkabi_fiyat'])+" TL")])
            treewidget.addTopLevelItem(l1)
        arraylist = []
        arrayliste = []
#%%regresyonlar
        def rgr():
            a=10
            while a>1:

                x =  np.array(fiyatlardizi).astype(np.float)
                arraylist.append(np.sum(x))

                arrayliste.append(np.sum(arraylist))
                a-=1
        rgr()
#%%tahminleme
        from sklearn.linear_model import LinearRegression
        linear_reg = LinearRegression()
        x = np.array(arrayliste)
        y = np.array([1, 2, 3, 4, 5,6,7,8,9])
        x = x.reshape(-1, 1)
        y = y.reshape(-1, 1)
        linear_reg.fit(y, x)
        tahmin = linear_reg.predict([[1]])  # Hangi haftayı tahminlemek istiyorsan burayı degısıyorsun
        haftaarray = np.arange(0, 10).reshape(-1, 1)
#%% görselleştirme
        plt.scatter(y, x)
        y_head_hafta = linear_reg.predict(haftaarray)
        plt.plot(haftaarray, y_head_hafta, color="green",alpha=0.3)
        plt.xlabel("Hafta")
        plt.ylabel("Kazanç")
        plt.show()
        grid.addWidget(treewidget,0,1)
        conn.commit()

#%% arayüz
        print("***********************************")
        print("Ayakkabı Stok Takibine Hoşgeldiniz")
        print("***********************************")
        print("Toplam ayakkabı sayısını öğrenmek için 1, Gelecek haftaki Karı öğrenmek için 2,Uygulamaya girmek için 3e basınız")
        while(True):
            a = int(input("Lütfen Sayıyı giriniz:"))
            if (a==1):
                print("Toplam Ayakkabı Tür sayısı:", len(baslıklardizi))
            elif a==2:
                print("Bütün ürünler satıldığı takdirde kazanılacak miktar:", int(tahmin)," TL'dir")
            elif a==3:
                print("Uygulama Açıldı. Hoşçakalın...")
                break
#%% ufak özelleştirmeler
        self.show()
        self.setLayout(grid)
        self.setStyleSheet("background-color: deeppink;")
        treewidget.setStyleSheet("background-color: pink;")
        self.setWindowTitle("Ayakkabı Stok Takip")
#%% execute
app=(QtWidgets.QApplication(sys.argv))
pencere=Pencere()
sys.exit(app.exec_())

