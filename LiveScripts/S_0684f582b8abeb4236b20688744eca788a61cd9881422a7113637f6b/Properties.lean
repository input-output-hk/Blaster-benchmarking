import LiveScripts.Shared
import LiveScripts.S_0684f582b8abeb4236b20688744eca788a61cd9881422a7113637f6b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0684f582b8abeb4236b20688744eca788a61cd9881422a7113637f6b.script [ctx] 10000]
