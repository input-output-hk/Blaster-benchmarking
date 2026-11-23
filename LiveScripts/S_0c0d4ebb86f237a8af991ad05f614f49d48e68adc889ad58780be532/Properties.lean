import LiveScripts.Shared
import LiveScripts.S_0c0d4ebb86f237a8af991ad05f614f49d48e68adc889ad58780be532.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0c0d4ebb86f237a8af991ad05f614f49d48e68adc889ad58780be532.script [ctx] 10000]
