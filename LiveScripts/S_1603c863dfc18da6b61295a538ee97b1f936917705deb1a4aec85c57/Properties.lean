import LiveScripts.Shared
import LiveScripts.S_1603c863dfc18da6b61295a538ee97b1f936917705deb1a4aec85c57.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1603c863dfc18da6b61295a538ee97b1f936917705deb1a4aec85c57.script [ctx] 10000]
