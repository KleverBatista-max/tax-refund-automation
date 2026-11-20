# Tax refund automation (Amazon + eBay)

One of my first projects (2023). At my cargo company, customers bought on Amazon and shipped to our Florida warehouse; Amazon charged Florida sales tax (7%) even though the package was then exported. We found that with an export certificate you can write to the store, prove the package left the country and get the tax refunded. Doing that by hand for dozens of orders is slow, so I automated each step:

| File | What it does |
|---|---|
| `amazon_order_tracking_scraper.ipynb` | Selenium: opens your Amazon order history in your own Chrome profile, clicks every **Track package** and collects the tracking IDs |
| `vba/amazon_macros.txt`, `vba/ebay_macros.txt` | Excel macros (the workbooks keep a DATA sheet, a per-order document sheet and a mailer sheet). `Generate` exports the active sheet to PDF named after a cell; `GenerateAll` repeats it for all N orders; `CreateCourseCertificates` opens one Outlook draft per order with the PDF attached, asking for the refund |
| `hotkeys.ahk` | AutoHotkey shortcuts that went with it |

The workbooks themselves are not included (they hold personal data); the macros are plain text, ready to paste into a new workbook. Replace `<FORWARDER ADDRESS>` and `<YOUR NAME>` with your own, and adjust cell references (`Q2`, `Q5`, `O3`, `O8`…) to your sheet.

Created by **John Batista** ([@KleverBatista-max](https://github.com/KleverBatista-max)). MIT licensed. Use it only on your own accounts and follow each store's terms.
