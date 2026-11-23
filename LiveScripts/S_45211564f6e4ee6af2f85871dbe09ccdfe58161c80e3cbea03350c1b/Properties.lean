import LiveScripts.Shared
import LiveScripts.S_45211564f6e4ee6af2f85871dbe09ccdfe58161c80e3cbea03350c1b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_45211564f6e4ee6af2f85871dbe09ccdfe58161c80e3cbea03350c1b.script [ctx] 10000]
