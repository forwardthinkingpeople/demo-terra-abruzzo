# cliente-terra-abruzzo

Sito demo pilota — Terra d'Abruzzo Ceramiche  
Gestito da SitoPartner™ | Infrastruttura: Cloudflare Pages + Stripe Connect

---

## Deploy su Cloudflare Pages

### 1. Clona e prepara

```bash
git clone https://github.com/TUONOME/cliente-terra-abruzzo.git
cd cliente-terra-abruzzo
```

### 2. Collega a Cloudflare Pages (una tantum)

Vai su [dash.cloudflare.com](https://dash.cloudflare.com) → Workers & Pages → Create application → Pages → Connect to Git → seleziona questo repo.

Impostazioni build:
- **Framework preset**: None
- **Build command**: (vuoto)
- **Build output directory**: `public`

### 3. Variabili d'ambiente (Settings → Environment variables)

Aggiungi queste variabili in **Production**:

| Variabile | Valore |
|---|---|
| `STRIPE_SECRET_KEY` | `sk_live_...` (o `sk_test_...` per test) |
| `STRIPE_CONNECTED_ACCOUNT_ID` | `acct_...` (account Stripe del cliente) |
| `STRIPE_WEBHOOK_SECRET` | `whsec_...` (da Stripe Dashboard → Webhooks) |
| `SITE_URL` | URL del sito (es. `https://terraabruzzo.it`) |

### 4. Webhook Stripe

In Stripe Dashboard → Developers → Webhooks → Add endpoint:
- URL: `https://cliente-terra-abruzzo.pages.dev/api/webhook`
- Events: `checkout.session.completed`, `payment_intent.succeeded`

---

## Struttura repo

```
/
├── public/
│   ├── index.html          # Sito principale
│   └── successo.html       # Pagina post-pagamento
├── functions/
│   └── api/
│       ├── checkout.js     # Crea Stripe Checkout Session
│       └── webhook.js      # Riceve eventi Stripe
├── wrangler.toml
└── README.md
```

---

## Aggiungere un nuovo cliente

```bash
# 1. Duplica questo repo
gh repo create cliente-NOMECLIENTE --template TUONOME/cliente-terra-abruzzo --public

# 2. Sostituisci contenuti (index.html, immagini, prodotti)

# 3. Aggiungi variabili d'ambiente con le credenziali del nuovo cliente

# 4. Collega a Cloudflare Pages → deploy automatico
```

---

## Platform fee

La platform fee del **5%** viene trattenuta automaticamente da Stripe su ogni transazione e accreditata sull'account piattaforma. Il cliente riceve il netto residuo direttamente sul suo account Stripe Connect.

Modificare la percentuale in `functions/api/checkout.js`:
```js
const PLATFORM_FEE_PERCENT = 5; // ← cambia qui
```
