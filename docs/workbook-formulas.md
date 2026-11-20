# Where the logic really lives: the workbook formulas

The VBA is tiny (export to PDF, loop, Outlook drafts). Almost all of the work is done by **cell formulas**, so if you rebuild the workbook, these are the parts that matter. Cell letters are from my sheets; adapt them to yours.

## `DATOS` sheet (one row per order)
| Where | Formula | Meaning |
|---|---|---|
| eBay `C` | `=K2*7%` | Florida sales tax (7 %) on the item price in `K` |
| Amazon `G` / eBay `H` | `=B2*1/7%`, `=C2*1/7%` | Work backwards from the tax paid to the taxable amount (tax ÷ 0.07) |
| `D` (Amazon) / `E` (eBay) | `="PA"&E2` | Builds the waybill number: prefix `PA` + the number in the next column |
| Amazon `F` / eBay `G` | `=ROUNDUP(G2*0.045,0)` | A 4.5 % amount rounded up to whole units (used on the document) |
| last row | `=SUM(C2:C40)` | Total refund requested |

## `FACTURA` sheet (the document, one order at a time)
`Q6` holds the **current order number**; every field is pulled from `DATOS` with `INDEX(DATOS!$D$2:$D$997, FACTURA!Q6)`.
- `Q2`: `="Airway Bill For Order #"&INDEX(DATOS!$A$2:$A$1000, FACTURA!Q6)` is the **PDF file name**, which the `Generate` macro reads.
- `Q5`: `=COUNTA(DATOS!A2:A376)` counts the orders, which `GenerateAll` loops over (it writes 1…N into `Q6`).
- Totals: `H22 =G*2.5`, `H23 =G*0.000001`, `H24 =H*2%`, `H25 =H*7%`, and `H26` adds the four lines together. The labels on the sheet are *Seguro, Flete, Impuesto, TOTAL*, so these are the insurance, freight and tax lines.

## `Mailer` sheet (Amazon workbook)
`="Airway Bill For Order #"&(E2)&".pdf"` rebuilds each PDF's file name, and `=DATOS!A2` the order number, so the Outlook macro (`CreateCourseCertificates`) can attach `path & file name` and write the order number in the email body.

## The eBay workbook
There is no separate eBay VBA beyond `Generate` and `GenerateAll`: the `EBAY` sheet is ~190 formulas that mirror `DATOS` (`=DATOS!A2`, `=DATOS!B2`, …) in the layout eBay's refund form expects, and the `FACTURA` sheet works exactly like Amazon's.
