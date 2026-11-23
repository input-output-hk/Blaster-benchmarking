import LiveScripts.Shared
import LiveScripts.S_682b5daf4b81af3f27e6b851a5e47b42f6384d423cbe3aa29953548d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_682b5daf4b81af3f27e6b851a5e47b42f6384d423cbe3aa29953548d.script [ctx] 10000]
