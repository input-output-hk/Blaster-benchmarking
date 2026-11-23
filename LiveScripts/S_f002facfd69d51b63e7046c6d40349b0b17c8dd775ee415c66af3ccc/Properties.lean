import LiveScripts.Shared
import LiveScripts.S_f002facfd69d51b63e7046c6d40349b0b17c8dd775ee415c66af3ccc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f002facfd69d51b63e7046c6d40349b0b17c8dd775ee415c66af3ccc.script [datum, redeemer, ctx] 10000]
