import LiveScripts.Shared
import LiveScripts.S_e96072523b00e9fdfa65e33753861e94bb6a57fb836bb683cbefe792.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e96072523b00e9fdfa65e33753861e94bb6a57fb836bb683cbefe792.script [ctx] 10000]
