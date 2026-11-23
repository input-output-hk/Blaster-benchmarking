import LiveScripts.Shared
import LiveScripts.S_abcc1ae826fe2dfbb423159bac88a7c7d095a5513f690827bae87ecf.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_abcc1ae826fe2dfbb423159bac88a7c7d095a5513f690827bae87ecf.script [ctx] 10000]
