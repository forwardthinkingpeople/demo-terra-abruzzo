#!/bin/bash
# setup.sh — Esegui una volta sola dopo aver clonato il repo
# Uso: bash setup.sh

set -e

echo "🚀 SitoPartner — Setup cliente"
echo "================================"

# Verifica dipendenze
command -v git >/dev/null 2>&1 || { echo "❌ Git non trovato. Installa git prima di procedere."; exit 1; }

echo ""
echo "📁 Struttura repo pronta."
echo ""
echo "Prossimi passi:"
echo ""
echo "1. Crea il repo su GitHub:"
echo "   gh repo create cliente-terra-abruzzo --public --source=. --push"
echo "   oppure: git remote add origin https://github.com/TUONOME/cliente-terra-abruzzo.git"
echo "           git add . && git commit -m 'Initial deploy' && git push -u origin main"
echo ""
echo "2. Vai su Cloudflare Pages e collega il repo:"
echo "   https://dash.cloudflare.com → Workers & Pages → Create → Pages → Connect to Git"
echo "   Build output: public"
echo ""
echo "3. Aggiungi variabili d'ambiente in Cloudflare Pages → Settings → Variables:"
echo "   STRIPE_SECRET_KEY=sk_test_..."
echo "   STRIPE_CONNECTED_ACCOUNT_ID=acct_..."
echo "   SITE_URL=https://cliente-terra-abruzzo.pages.dev"
echo ""
echo "✅ Dopo il primo push il sito sarà live in ~60 secondi."
