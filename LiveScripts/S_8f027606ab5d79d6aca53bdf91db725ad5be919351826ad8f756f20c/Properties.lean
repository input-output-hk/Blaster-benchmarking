import LiveScripts.Shared
import LiveScripts.S_8f027606ab5d79d6aca53bdf91db725ad5be919351826ad8f756f20c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8f027606ab5d79d6aca53bdf91db725ad5be919351826ad8f756f20c.script [redeemer, ctx] 10000]
