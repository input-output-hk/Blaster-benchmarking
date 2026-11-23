import LiveScripts.Shared
import LiveScripts.S_71968a8df882a4dd24688b7904473a5d5f7e35332cba063e6ad7d379.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_71968a8df882a4dd24688b7904473a5d5f7e35332cba063e6ad7d379.script [ctx] 10000]
