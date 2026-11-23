import LiveScripts.Shared
import LiveScripts.S_e04c69f7b9a0b744cd94e5751057bf2df8ce458c0266613850edc122.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e04c69f7b9a0b744cd94e5751057bf2df8ce458c0266613850edc122.script [datum, redeemer, ctx] 10000]
