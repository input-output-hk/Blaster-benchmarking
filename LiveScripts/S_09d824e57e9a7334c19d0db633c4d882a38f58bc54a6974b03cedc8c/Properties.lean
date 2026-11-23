import LiveScripts.Shared
import LiveScripts.S_09d824e57e9a7334c19d0db633c4d882a38f58bc54a6974b03cedc8c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_09d824e57e9a7334c19d0db633c4d882a38f58bc54a6974b03cedc8c.script [ctx] 10000]
