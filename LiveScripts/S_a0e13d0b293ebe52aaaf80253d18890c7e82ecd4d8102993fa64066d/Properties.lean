import LiveScripts.Shared
import LiveScripts.S_a0e13d0b293ebe52aaaf80253d18890c7e82ecd4d8102993fa64066d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a0e13d0b293ebe52aaaf80253d18890c7e82ecd4d8102993fa64066d.script [ctx] 10000]
