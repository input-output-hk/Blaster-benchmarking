import LiveScripts.Shared
import LiveScripts.S_fb5a2da943dd332c389f27df7eb3c88f5dc67477abcfb3f096a32fdd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fb5a2da943dd332c389f27df7eb3c88f5dc67477abcfb3f096a32fdd.script [ctx] 10000]
