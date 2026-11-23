import LiveScripts.Shared
import LiveScripts.S_b20f4f18c268e901f55aa8109e4447c8af2b522aedf81852946793d7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b20f4f18c268e901f55aa8109e4447c8af2b522aedf81852946793d7.script [ctx] 10000]
