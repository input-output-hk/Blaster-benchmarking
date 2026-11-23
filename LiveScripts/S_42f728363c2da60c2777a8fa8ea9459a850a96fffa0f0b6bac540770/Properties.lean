import LiveScripts.Shared
import LiveScripts.S_42f728363c2da60c2777a8fa8ea9459a850a96fffa0f0b6bac540770.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_42f728363c2da60c2777a8fa8ea9459a850a96fffa0f0b6bac540770.script [ctx] 10000]
