import LiveScripts.Shared
import LiveScripts.S_2a9677968ed432716017c6c00b2800682449689ca5fffee802840af4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2a9677968ed432716017c6c00b2800682449689ca5fffee802840af4.script [ctx] 10000]
