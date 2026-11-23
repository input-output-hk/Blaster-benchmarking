import LiveScripts.Shared
import LiveScripts.S_5124cabd402a056656bc35a8aa6a5599e25d6108e88ca4c1dd5cb1bb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5124cabd402a056656bc35a8aa6a5599e25d6108e88ca4c1dd5cb1bb.script [ctx] 10000]
