import LiveScripts.Shared
import LiveScripts.S_23ec83036d5274cd2a50b9ab76ae337ebec682910178cbc1813c2127.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_23ec83036d5274cd2a50b9ab76ae337ebec682910178cbc1813c2127.script [ctx] 10000]
