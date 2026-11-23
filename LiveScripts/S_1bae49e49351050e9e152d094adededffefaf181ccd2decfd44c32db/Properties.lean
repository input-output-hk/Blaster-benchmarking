import LiveScripts.Shared
import LiveScripts.S_1bae49e49351050e9e152d094adededffefaf181ccd2decfd44c32db.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1bae49e49351050e9e152d094adededffefaf181ccd2decfd44c32db.script [ctx] 10000]
