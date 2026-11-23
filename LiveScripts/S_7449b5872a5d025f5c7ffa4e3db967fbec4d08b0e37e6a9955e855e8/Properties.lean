import LiveScripts.Shared
import LiveScripts.S_7449b5872a5d025f5c7ffa4e3db967fbec4d08b0e37e6a9955e855e8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7449b5872a5d025f5c7ffa4e3db967fbec4d08b0e37e6a9955e855e8.script [ctx] 10000]
