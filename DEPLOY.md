# 🚀 SIB Group — Panduan Deploy ke Railway (GRATIS)

## Langkah 1 — Upload ke GitHub

1. Buat akun di https://github.com (gratis)
2. Klik **New Repository**, nama: `sib-group`
3. Buka terminal di folder project, jalankan:

```bash
git init
git add .
git commit -m "SIB Group - first deploy"
git branch -M main
git remote add origin https://github.com/USERNAME/sib-group.git
git push -u origin main
```

---

## Langkah 2 — Deploy ke Railway

1. Buka https://railway.app
2. **Login with GitHub**
3. Klik **New Project** → **Deploy from GitHub repo**
4. Pilih repo **sib-group**
5. Railway otomatis detect Laravel & mulai build ✅

---

## Langkah 3 — Setting Environment Variables

Di Railway dashboard → tab **Variables**, tambahkan:

```
APP_URL = https://URL-ANDA.railway.app
APP_KEY = (kosongkan dulu, akan di-generate otomatis)
```

---

## Langkah 4 — Generate Domain

Di Railway → tab **Settings** → **Networking** → klik **Generate Domain**

Website Anda langsung live di:
`https://sib-group-xxxx.railway.app`

---

## Login Admin

```
URL   : https://your-url.railway.app/admin/login
Email : admin@sib.com
Password : admin123
```

> ⚠️ Ganti password setelah pertama login!

---

## Estimasi Waktu
- Upload GitHub   : 5 menit
- Deploy Railway  : 3-5 menit
- **Total : ~10 menit** 🎉
