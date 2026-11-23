import LiveScripts.Shared
import LiveScripts.S_1a6a0dba0fd474fdaa50edd190858c0818e45affff1c2f380525596f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1a6a0dba0fd474fdaa50edd190858c0818e45affff1c2f380525596f.script [ctx] 10000]
